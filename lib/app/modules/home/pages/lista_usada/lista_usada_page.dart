import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista_usada/lista_usada_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista_usada/widgets/nome_produto_widget.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista_usada/widgets/quantidade_itens_widget.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista_usada/widgets/selecao_item_widget.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_button.dart';
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
    return FutureBuilder<ObservableList<ItemUsadoViewModel>>(
      future: store.loadItems(widget.lista),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Scaffold(
          appBar: AppBarCustom(title: widget.lista.nmLista),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    height:100.0,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 228, 243, 221),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0, left: 10.0),
                          child: Text(
                            '10 produtos a pegar',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            '15 produtos pegos',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ]
              ),
              Expanded( //        <-- Use Expanded 
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
                                  child: NomeProdutoWidget(itemUsado: store.items[index])
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          store.salvar(store.items[index]);
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