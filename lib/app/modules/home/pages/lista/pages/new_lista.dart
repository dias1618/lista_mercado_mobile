import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/widgets/descricao_widget.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';

class NewLista extends StatefulWidget {
  const NewLista({ Key? key }) : super(key: key);

  @override
  State<NewLista> createState() => _NewListaState();
}

class _NewListaState extends ModularState<NewLista, ListaStore> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCustom(
          title: 'Nova Lista',
        ),
        body: Descricao()
    );
  }
}