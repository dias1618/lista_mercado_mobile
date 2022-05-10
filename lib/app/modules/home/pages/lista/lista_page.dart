import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/widgets/descricao_widget.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/widgets/itens/itens_widget.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';

class ListaPage extends StatefulWidget {
  final String title;
  final ListaModel? lista;

  const ListaPage({
    Key? key, 
    required this.title,
    this.lista
  }) : super(key: key);

  @override
  ListaPageState createState() => ListaPageState();
}
class ListaPageState extends ModularState<ListaPage, ListaStore> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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