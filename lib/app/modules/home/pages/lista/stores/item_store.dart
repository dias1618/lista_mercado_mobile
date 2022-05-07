import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/repositories/item_repository.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStoreBase with _$ItemStore;
abstract class _ItemStoreBase with Store {

  final ItemRepository itemRepository = Modular.get<ItemRepository>();

  @observable
  ListaModel? listaModel;

  @action
  load(ListaModel? listaModel){
    this.listaModel = listaModel;
  }

  @action
  remove(ItemModel itemModel)async {
    try{
      await itemRepository.remove(itemModel.id);
      EasyLoading.showSuccess('Item removido com sucesso!');
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

}