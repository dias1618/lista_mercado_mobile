import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/categoria_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_dao.dart';

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
    List<Map<dynamic, dynamic>> orderMap = [];
    List<Map<dynamic, dynamic>>? map = await itemDAO.find(query);
    for (Map<dynamic, dynamic> itemMap in map!) {
      itemMap = await ItemModel.toDatabaseJson(itemMap as Map<String, dynamic>);
      _sort(orderMap, itemMap);
    }
    return orderMap;
  }

  _sort(List<Map<dynamic, dynamic>> orderMap, Map<dynamic, dynamic> itemMap){
    for(int i = 0; i < orderMap.length; i++) {
      Map<dynamic, dynamic> itemOrder = orderMap.elementAt(i);
      if(itemOrder['categoria'] == null && itemMap['categoria'] != null
        || ((itemOrder['categoria'] == null  || itemMap['categoria'] == null) && itemOrder['nmProduto'].compareTo(itemMap['nmProduto']) > 0)
        || (itemOrder['categoria'] != null && itemMap['categoria'] != null && itemOrder['categoria']['nmCategoria'].compareTo(itemMap['categoria']['nmCategoria']) > 0)
      ){
        orderMap.insert(i, itemMap);
        return;
      }
    }
    orderMap.add(itemMap);
  }
}
