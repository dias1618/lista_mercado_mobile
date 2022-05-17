import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/repositories/item_repository.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:mobx/mobx.dart';

part 'item_widget_store.g.dart';

class ItemWidgetStore = _ItemWidgetStoreBase with _$ItemWidgetStore;
abstract class _ItemWidgetStoreBase with Store {

  @observable
  ObservableList items = ObservableList<ItemModel>();

  final ItemRepository itemRepository = Modular.get<ItemRepository>();

  @observable
  ListaModel? listaModel;

  @action
  loadItems(ListaModel? listaModel){
    this.listaModel = listaModel;
    items = ObservableList<ItemModel>.of(listaModel?.itens ?? []);
  }

  @action
  remove(ItemModel itemModel)async {
    try{
      await itemRepository.remove(itemModel.id);
      EasyLoading.showSuccess('Item removido com sucesso!');
      for(ItemModel itemModelList in items){
        if(itemModelList.id == itemModel.id){
          items.remove(itemModelList);
          break;
        }
      }
      
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }
  
  void navigateItem(BuildContext context, ItemModel itemModel) async {
    Navigator.of(context).pushNamed(
      '/listas/itens', 
      arguments: {
        'title': itemModel.nmProduto, 
        'lista': listaModel,
        'item': itemModel
      }
    ).then((value){
      loadItems(value as ListaModel);
    });
  }

  void newItem(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/listas/itens', 
      arguments: {
        'title': 'Novo item', 
        'lista': listaModel
      }
    ).then((value){
      loadItems(value as ListaModel);
    });
  }

}