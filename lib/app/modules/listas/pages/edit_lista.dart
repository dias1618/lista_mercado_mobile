import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/listas/lista_store.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/descricao_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/itens/itens_widget.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';

class EditLista extends StatefulWidget {
  final String title;
  final ListaModel? lista;
  
  const EditLista({ 
    Key? key, 
    required this.title,
    this.lista
  }) : super(key: key);

  @override
  State<EditLista> createState() => _EditListaState();
}

class _EditListaState extends ModularState<EditLista, ListaStore> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCustom(
          title: widget.title,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Descrição'),
              Tab(text: 'Itens'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Descricao(lista: widget.lista),
            Itens(lista: widget.lista),
          ],
        ),
      )
    );
  }
}