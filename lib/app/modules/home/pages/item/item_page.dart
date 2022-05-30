import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/item/item_store.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_button.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_check_field.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_number_field.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ItemPage extends StatefulWidget {
  final String title;
  final ListaModel lista;
  final ItemModel? item;

  const ItemPage({
    Key? key, 
    required this.title,
    required this.lista,
    this.item
  }) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends ModularState<ItemPage, ItemStore> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: store.load(widget.lista, widget.item),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarCustom(
            title: widget.title,
          ),
          body: ReactiveForm(
            formGroup: store.form,
            child: Column(
              children: [
                const CustomReactiveTextField(
                  label: 'Nome', 
                  formControlName: 'nmProduto', 
                  validationMessages: {
                    'required': 'O nome da produto não pode ser vazio'
                  }
                ),
                const CustomReactiveNumberField(
                  label: 'Quantidade', 
                  formControlName: 'qtProduto', 
                  validationMessages: {}
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField(
                    value: store.form.controls['categoria']!.value != null ? (store.form.controls['categoria']!.value as CategoriaModel).id : 0,
                    decoration: const InputDecoration(labelText: 'Categoria'),
                    items: [
                      const DropdownMenuItem<int>(
                        value: 0,
                        child: Text('Selecione uma categoria'),
                      ),
                      ...store.categorias.map<DropdownMenuItem<int>>((categoria) => 
                        DropdownMenuItem(child: Text(categoria.nmCategoria), value: categoria.id)
                      ).toList()
                    ],
                    onChanged: (value) {
                      for (CategoriaModel categoria in store.categorias) {
                        if(categoria.id == value) {
                          store.form.controls['categoria']?.updateValue(categoria);
                        }
                      }
                    },
                  ),
                ),
                const CustomReactiveCheckField(
                  label: 'Ativado',
                  formControlName: 'lgProduto',
                  validationMessages: {}
                ),
                CustomButton(
                  label: 'Salvar', 
                  onPressed: store.salvar, 
                  color: Theme.of(context).primaryColor,
                ),
                Visibility(
                  visible: widget.item != null,
                  child: CustomButton(
                    label: 'Remover', 
                    onPressed: store.remover, 
                    color: Theme.of(context).errorColor,
                  ),
                )
              ],
            ),
          )
        );
      }
    );
  }
}