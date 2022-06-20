import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/item_usado_service.dart';

class ItemUsadoController extends Controller<ItemUsadoModel>{

  final ItemUsadoService _itemUsadoService = ItemUsadoService();

  @override
  Future delete(int id) {
    return _itemUsadoService.delete(id);
  }

  @override
  Future get(int id) {
    return _itemUsadoService.get(id);
  }

  @override
  Future post(ItemUsadoModel object) {
    return _itemUsadoService.insert(object);
  }

  @override
  Future put(ItemUsadoModel object) {
    return _itemUsadoService.update(object);
  }

  @override
  Future find(Map<String, dynamic>? query) {
    return _itemUsadoService.find(query);
  }

}