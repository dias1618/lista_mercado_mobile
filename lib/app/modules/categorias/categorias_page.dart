import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/categorias/categorias_store.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_nav_drawer.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({ Key? key }) : super(key: key);

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends ModularState<CategoriasPage, CategoriasStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavDrawer(),
      appBar: AppBar(
        title: const Text('Categorias')
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          shrinkWrap: true,
          itemCount: store.categorias.length,
          itemBuilder: (BuildContext ctxt, int index){
            return GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text(store.categorias[index].nmCategoria),
                ),
              ),
              onTap: () => store.navigateCategoria(context, store.categorias[index]),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.newCategoria(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}