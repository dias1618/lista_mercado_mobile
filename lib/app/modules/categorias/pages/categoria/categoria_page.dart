import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/modules/categorias/pages/categoria/categoria_store.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_button.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_check_field.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_number_field.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CategoriaPage extends StatefulWidget {
  final String title;
  final CategoriaModel? categoria;

  const CategoriaPage({
    Key? key, 
    required this.title,
    this.categoria
  }) : super(key: key);

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends ModularState<CategoriaPage, CategoriaStore> {
  @override
  Widget build(BuildContext context) {
    store.load(widget.categoria);
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
              formControlName: 'nmCategoria', 
              validationMessages: {
                'required': 'O nome da categoria não pode ser vazio'
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
      )
    );
  }
}