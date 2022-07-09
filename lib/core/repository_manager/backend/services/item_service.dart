import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/categoria_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/utils/entity_util.dart';

class ItemService {
  final ItemDAO itemDAO = ItemDAO();
  final CategoriaDAO categoriaDAO = CategoriaDAO();
  final ListaDAO listaDAO = ListaDAO();

  insert(ItemModel itemModel) async {
    Map<String, dynamic> data = itemModel.toJsonDatabase();
    int id = await itemDAO.insert(data);
    itemModel.id = id;
    return itemModel.toJson();
  }

  update(ItemModel itemModel) async {
    Map<String, dynamic> data = itemModel.toJsonDatabase();
    await itemDAO.update(data);
    return itemModel.toJson();
  }

  delete(int id) async {
    Map<dynamic, dynamic> data = (await itemDAO.get(id))!;
    await itemDAO.delete(id);
    return data;
  }

  get(int id) async {
    Map<dynamic, dynamic>? data = await itemDAO.get(id);
    return data;
  }

  find(Map<String, dynamic>? query) async {
    List<Map<dynamic, dynamic>>? map = await itemDAO.find(query);
    for (Map<dynamic, dynamic> itemMap in map!) {
      itemMap = await ItemModel.toDatabaseJson(itemMap as Map<String, dynamic>);
    }
    return map;
  }
}
