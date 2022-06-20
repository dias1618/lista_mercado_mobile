
import 'package:flutter/material.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_builder.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/core/storages/lista_usada_storage.dart';
import 'package:mobx/mobx.dart';

part 'lista_usada_store.g.dart';

class ListaUsadaStore = _ListaUsadaStoreBase with _$ListaUsadaStore;
abstract class _ListaUsadaStoreBase with Store {

  late ListaUsadaModel? listaUsadaModel;
  ObservableList<ItemUsadoModel> items = ObservableList<ItemUsadoModel>();

  @observable
  int itensMarcados = 0;

  @observable
  int itensNaoMarcados = 0;

  @action
  Future<ObservableList<ItemUsadoModel>> loadItems(ListaModel? listaModel) async{
    if(await ListaUsadaStorage.isExist(listaModel!)){
      listaUsadaModel = await ListaUsadaStorage.getListaUsada(listaModel.id);
      for(ItemUsadoModel item in listaUsadaModel!.itensUsados){
        items.add(item);
        initSumario(item);
      }
    }
    else{
      listaUsadaModel = ListaUsadaBuilder(listaModel.id).build();
      items = ObservableList<ItemUsadoModel>();
      listaModel.itens.asMap().forEach((index, itemModel) {
        if(itemModel.lgProduto){
          ItemUsadoModel itemUsadoModel = ItemUsadoModel(0, 0, itemModel.id, false, null);
          listaUsadaModel!.itensUsados.add(itemUsadoModel);
        }
      });
      
      listaUsadaModel = await ListaUsadaStorage.saveListaUsada(listaUsadaModel!);
      listaUsadaModel!.itensUsados.asMap().forEach((index, itemUsadoModel) {
        items.add(itemUsadoModel);
      });

      itensMarcados = 0;
      itensNaoMarcados = items.length;

    }
    return items;
  }

  @action
  salvar(){
    itensMarcados = 0;
    itensNaoMarcados = 0;
    for(ItemUsadoModel item in listaUsadaModel!.itensUsados){
      initSumario(item);
    }
    ListaUsadaStorage.saveListaUsada(listaUsadaModel!);
  }

  @action
  fechar(BuildContext context){
    listaUsadaModel!.lgFechada = true;
    ListaUsadaStorage.saveListaUsada(listaUsadaModel!);
    Navigator.pop(context);
  }

  initSumario(ItemUsadoModel item){
    if(item.lgMarcado!){
      itensMarcados++;
    }
    else{
      itensNaoMarcados++;
    }
  }

}