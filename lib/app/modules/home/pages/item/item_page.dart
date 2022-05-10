import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    store.load(widget.lista, widget.item);
    return Scaffold(
      appBar: AppBarCustom(
        title: widget.title,
      ),
      body: ReactiveForm(
        formGroup: store.form,
        child: Column(
          children: <Widget>[
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
            CustomButton(
              label: 'Remover', 
              onPressed: store.remover, 
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      )
    );
  }
}