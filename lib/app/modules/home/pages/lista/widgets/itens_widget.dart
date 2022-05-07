import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/stores/item_store.dart';

class Itens extends StatefulWidget {
  
  final ListaModel? lista;

  const Itens({ 
    Key? key,
    required this.lista
  }) : super(key: key);

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends ModularState<Itens, ItemStore> {
  @override
  Widget build(BuildContext context) {
    store.load(widget.lista);
    return Observer(
      builder: (context) => ListView.builder(
        shrinkWrap: true,
        itemCount: store.listaModel!.itens.length,
        itemBuilder: (BuildContext ctxt, int index){
          return GestureDetector(
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${store.listaModel!.itens[index].qtProduto} item(s)',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          store.listaModel!.itens[index].nmProduto,
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        child: const Icon(Icons.delete_outline),
                        onPressed: () {
                          store.remove(store.listaModel!.itens[index]);
                        }
                      ),
                    )
                  )
                ],
              ),
            ),
            onTap: (){
              
            },
          );
        }
      ),
    );
  }
}