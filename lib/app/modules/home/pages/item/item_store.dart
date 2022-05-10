import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/repositories/item_repository.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStoreBase with _$ItemStore;
abstract class _ItemStoreBase with Store {

  final ItemRepository itemRepository = Modular.get<ItemRepository>();

  @observable
  ItemModel? itemModel;

  @observable
  ListaModel? listaModel;

  final form = FormGroup({
    'id': FormControl<int>(),
    'nmProduto': FormControl<String>(),
    'qtProduto': FormControl<int>(),
    'lgProduto': FormControl<bool>(),
    'lista': FormControl<ListaModel>(),
  });

  @action
  load(ListaModel? listaModel, ItemModel? itemModel) async {
    this.itemModel = itemModel;
    this.listaModel = listaModel;
    if(this.itemModel != null){
      form.patchValue({
        'id': this.itemModel!.id,
        'nmProduto': this.itemModel!.nmProduto,
        'qtProduto': this.itemModel!.qtProduto,
        'lgProduto': this.itemModel!.lgProduto,
      });
    }
  }

  
  @action
  salvar(BuildContext context) async {
    try{
      itemModel = ItemModel.fromJson(form.value);
      itemModel!.lista = listaModel;
      if(itemModel!.id > 0){
        itemModel = await itemRepository.update(itemModel!);
        listaModel!.itens.asMap().forEach((index, itemModelList) {
          if(itemModelList.id == itemModel!.id){
            listaModel!.itens[index] = itemModel!;
          }
        });
      } else {
        itemModel = await itemRepository.create(itemModel!);
        listaModel!.itens.add(itemModel!);
      }
      EasyLoading.showSuccess('Item salvo com sucesso!');
      Navigator.pop(context, listaModel);
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  } 

  @action
  remover(BuildContext context) async {
    try{
      itemModel = ItemModel.fromJson(form.value);
      await itemRepository.remove(itemModel!.id);
      EasyLoading.showSuccess('Item removido com sucesso!');
      int indexRemove = -1;
      listaModel!.itens.asMap().forEach((index, itemModelList) {
        if(itemModelList.id == itemModel!.id){
          indexRemove = index;
        }
      });
      listaModel!.itens.removeAt(indexRemove);
      Navigator.pop(context, listaModel);
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

}