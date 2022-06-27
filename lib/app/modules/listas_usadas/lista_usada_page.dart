import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/lista_usada_store.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/detalhe_arredondado_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/nome_categoria_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/nome_produto_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/quantidade_itens_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/selecao_item_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/sumario_widget.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';
import 'package:mobx/mobx.dart';

class ListaUsada extends StatefulWidget {

  final ListaModel lista;

  const ListaUsada({ Key? key, required this.lista }) : super(key: key);

  @override
  State<ListaUsada> createState() => _ListaUsadaState();
}

class _ListaUsadaState extends ModularState<ListaUsada, ListaUsadaStore> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ObservableList<ItemUsadoModel>>(
      future: store.loadItems(widget.lista),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Scaffold(
          appBar: AppBarCustom(
            title: widget.lista.nmLista!,
            bottomOpacity: 0.0,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              store.fechar(context);
            },
            child: const Icon(Icons.shopping_cart_outlined),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Stack(
                children: const <Widget> [
                  DetalheArredondado(),
                  SumarioWidget(),
                ]
              ),
              Expanded(  
                child: Observer(
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
                            elevation: 3.0,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SelecaoItemWidget(itemUsado: store.items[index], salvar: store.salvar)
                                ),
                                Expanded(
                                  child: QuantidadeItensWidget(itemUsado: store.items[index]),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      NomeProdutoWidget(itemUsado: store.items[index]),
                                      NomeCategoriaWidget(itemUsado: store.items[index]),
                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          store.salvar();
                        },
                      );
                    }
                  )
                )
              )
            ]
          )
        );
      }
    );
  }
}