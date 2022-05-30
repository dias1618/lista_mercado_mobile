import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/item_service.dart';

class ListaService{

  final ListaDAO listaDAO = ListaDAO();
  final ItemService itemService = ItemService();

  insert(ListaModel listaModel) async {
    Map<String, dynamic> data = listaModel.toJson();
    int id = await listaDAO.insert(data);
    listaModel.id = id;
    return listaModel.toJson();
  }

  update(ListaModel listaModel) async {
    Map<String, dynamic> data = listaModel.toJson();
    await listaDAO.update(data);
    return listaModel.toJson();
  }
  
  delete(int id) async {
    Map<dynamic, dynamic> data = (await listaDAO.get(id))!;
    await listaDAO.delete(id);
    List<Map<dynamic, dynamic>>? itens = await itemService.find({'listaId': id});
    for(Map<dynamic, dynamic> item in itens!){
      await itemService.delete(item['id']);
    }
    return data;
  }

  get(int id) async {
    Map<dynamic, dynamic>? data = await listaDAO.get(id);
    return data!;
  }

  find(Map<String, dynamic>? query) async {
    List<Map<dynamic, dynamic>>? map = await listaDAO.find(query);
    for(Map<dynamic, dynamic> itemMap in map!){
      itemMap['itens'] = await itemService.find({'listaId': itemMap['id']});
    }
    return map;
  }
  
}