import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_usado_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_usada_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/item_service.dart';

class ItemUsadoService {
  final ItemUsadoDAO itemUsadoDAO = ItemUsadoDAO();
  final ListaUsadaDAO listaUsadaDAO = ListaUsadaDAO();
  final ItemService itemService = ItemService();

  insert(ItemUsadoModel itemUsadoModel) async {
    Map<String, dynamic> data = itemUsadoModel.toJsonDatabase();
    int id = await itemUsadoDAO.insert(data);
    itemUsadoModel.id = id;
    return itemUsadoModel.toJson();
  }

  update(ItemUsadoModel itemUsadoModel) async {
    Map<String, dynamic> data = itemUsadoModel.toJsonDatabase();
    await itemUsadoDAO.update(data);
    return itemUsadoModel.toJson();
  }

  delete(int id) async {
    Map<dynamic, dynamic> data = (await itemUsadoDAO.get(id))!;
    await itemUsadoDAO.delete(id);
    return data;
  }

  get(int id) async {
    Map<dynamic, dynamic>? data = await itemUsadoDAO.get(id);
    return data!;
  }

  find(Map<String, dynamic>? query) async {
    List<Map<dynamic, dynamic>>? map = await itemUsadoDAO.find(query);
    for (Map<dynamic, dynamic> itemMap in map!) {
      itemMap = await ItemUsadoModel().toDatabaseJson(itemMap as Map<String, dynamic>);
    }
    return map;
  }
}
