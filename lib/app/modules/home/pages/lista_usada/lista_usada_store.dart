
import 'package:flutter/cupertino.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';
import 'package:lista_mercado_mobile/core/storages/lista_usada_storage.dart';
import 'package:mobx/mobx.dart';

part 'lista_usada_store.g.dart';

class ListaUsadaStore = _ListaUsadaStoreBase with _$ListaUsadaStore;
abstract class _ListaUsadaStoreBase with Store {

  ObservableList<ItemUsadoViewModel> items = ObservableList<ItemUsadoViewModel>();

  @observable
  int itensUsados = 0;

  @observable
  int itensNaoUsados = 0;

  @action
  Future<ObservableList<ItemUsadoViewModel>> loadItems(ListaModel? listaModel) async{
    if(await ListaUsadaStorage.isExist()){
      items = await ListaUsadaStorage.getListaUsada();
    }
    else{
      items = ObservableList<ItemUsadoViewModel>();
      listaModel?.itens.asMap().forEach((index, itemModel) {
        if(itemModel.lgProduto){
          items.add(ItemUsadoViewModel(itemModel.id, itemModel.nmProduto, itemModel.qtProduto, false, itemModel.lista, itemModel.categoria));
        }
      });
    }
    itensNaoUsados = items.length;
    return items;
  }

  @action
  salvar(ItemUsadoViewModel item){
    item.lgUsado = !item.lgUsado;
    if(item.lgUsado){
      itensUsados++;
      itensNaoUsados--;
    }
    else{
      itensUsados--;
      itensNaoUsados++;
    }
    ListaUsadaStorage.saveListaUsada(items);
  }

}