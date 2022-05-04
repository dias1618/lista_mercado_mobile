import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/home/home_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/widgets/item_lista_widget.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Lista de Mercado',
        leading: false,
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          shrinkWrap: true,
          itemCount: store.listas.length,
          itemBuilder: (BuildContext ctxt, int index){
            return ItemListaWidget(
              listaModel: store.listas[index], 
              treatDataUltimoUso: store.treatDataUltimoUso,
              navigateLista: store.navigateLista,
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.newLista(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}