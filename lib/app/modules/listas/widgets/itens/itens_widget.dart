import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/itens/item_widget_store.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/itens/widgets/nome_categoria_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/itens/widgets/nome_produto_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/itens/widgets/quantidade_itens_widget.dart';

class Itens extends StatefulWidget {
  
  final ListaModel? lista;

  const Itens({ 
    Key? key,
    required this.lista
  }) : super(key: key);

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends ModularState<Itens, ItemWidgetStore> {
  @override
  Widget build(BuildContext context) {
    store.loadItems(widget.lista);
    return Scaffold(
      body: Observer(
        builder: (context) => ListView.builder(
          shrinkWrap: true,
          itemCount: store.items.length,
          itemBuilder: (BuildContext ctxt, int index){
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: QuantidadeItensWidget(itemModel: store.items[index]),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            NomeProdutoWidget(itemModel: store.items[index]),
                            NomeCategoriaWidget(itemModel: store.items[index]),
                          ],
                        )
                      ),
                    ],
                  ),
                )
              ),
              onTap: (){
                store.navigateItem(context, store.items[index]);
              },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.newItem(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}