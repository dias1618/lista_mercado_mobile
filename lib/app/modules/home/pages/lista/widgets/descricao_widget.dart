import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_button.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_date_field.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Descricao extends StatefulWidget {

  final ListaModel? lista;

  const Descricao({ 
    Key? key,
    this.lista,
  }) : super(key: key);

  @override
  State<Descricao> createState() => _DescricaoState();
}

class _DescricaoState extends ModularState<Descricao, ListaStore> {
  @override
  Widget build(BuildContext context) {
    store.load(widget.lista);
    return Scaffold(
      body: ReactiveForm(
        formGroup: store.form,
        child: Column(
          children: <Widget>[
            const CustomReactiveTextField(
              label: 'Nome', 
              formControlName: 'nmLista', 
              validationMessages: {
                'required': 'O nome da lista não pode ser vazio'
              }
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.usarLista(context);
        },
        child: const Icon(Icons.slideshow),
      ),
    );
  }
}