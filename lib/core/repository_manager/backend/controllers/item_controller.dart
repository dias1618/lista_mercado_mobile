import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/item_service.dart';

class ItemController extends Controller<ItemModel>{

  final ItemService _itemService = ItemService();

  @override
  Future delete(int id) {
    return _itemService.delete(id);
  }

  @override
  Future get(int id) {
    return _itemService.get(id);
  }

  @override
  Future post(ItemModel object) {
    return _itemService.insert(object);
  }

  @override
  Future put(ItemModel object) {
    return _itemService.update(object);
  }

  @override
  Future find(Map<String, dynamic>? query) {
    return _itemService.find(query);
  }

}