import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_usado_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_usada_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/item_service.dart';

class ItemUsadoService{

  final ItemUsadoDAO itemUsadoDAO = ItemUsadoDAO();
  final ListaUsadaDAO listaUsadaDAO = ListaUsadaDAO();
  final ItemService itemService = ItemService();
  
  insert(ItemUsadoModel itemUsadoModel) async {
    Map<String, dynamic> data = itemUsadoModel.toJson();
    if(data['listaUsada'] != null){
      data['listaUsadaId'] = data['listaUsada']['id'];
      data.remove('listaUsada');
    }
    data['lgMarcado'] = data['lgMarcado'] ? 1 : 0;
    int id = await itemUsadoDAO.insert(data);
    itemUsadoModel.id = id;
    return itemUsadoModel.toJson();
  }

  update(ItemUsadoModel itemUsadoModel) async {
    Map<String, dynamic> data = itemUsadoModel.toJson();
    if(data['listaUsada'] != null){
      data['listaUsadaId'] = data['listaUsada']['id'];
      data.remove('listaUsada');
    }
    if(data['itemModel'] != null){
      data['itemId'] = data['itemModel']['id'];
      data.remove('itemModel');
    }
    data['lgMarcado'] = data['lgMarcado'] ? 1 : 0;
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
    List<Map<dynamic, dynamic>>? map =  await itemUsadoDAO.find(query);
    for(Map<dynamic, dynamic> itemMap in map!){
      itemMap['lgMarcado'] = _convertToBool(itemMap['lgMarcado']);
      itemMap['listaUsada'] = await _addLista(itemMap['listaUsadaId']);
      itemMap['itemModel'] = await itemService.get(itemMap['itemId']);
    }
    return map;
  }
  
  bool _convertToBool(int value){
    return value == 0?false:true;
  }

  Future<Map<dynamic, dynamic>?> _addLista(int? listaUsadaId) async{
    if(listaUsadaId != null){
      return await listaUsadaDAO.get(listaUsadaId);
    }
    return null;
  }
}