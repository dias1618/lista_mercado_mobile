import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/categoria_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_dao.dart';

class ItemService{

  final ItemDAO itemDAO = ItemDAO();
  final CategoriaDAO categoriaDAO = CategoriaDAO();
  final ListaDAO listaDAO = ListaDAO();
  
  insert(ItemModel itemModel) async {
    Map<String, dynamic> data = itemModel.toJson();
    if(data['lista'] != null){
      data['listaId'] = data['lista']['id'];
      data.remove('lista');
    }
    if(data['categoria'] != null){
      data['categoriaId'] = data['categoria']['id'];
      data.remove('categoria');
    }
    data['lgProduto'] = data['lgProduto'] ? 1 : 0;
    int id = await itemDAO.insert(data);
    itemModel.id = id;
    return itemModel.toJson();
  }

  update(ItemModel itemModel) async {
    Map<String, dynamic> data = itemModel.toJson();
    if(data['lista'] != null){
      data['listaId'] = data['lista']['id'];
      data.remove('lista');
    }
    if(data['categoria'] != null){
      data['categoriaId'] = data['categoria']['id'];
      data.remove('categoria');
    }
    data['lgProduto'] = data['lgProduto'] ? 1 : 0;
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
    List<Map<dynamic, dynamic>>? map =  await itemDAO.find(query);
    for(Map<dynamic, dynamic> itemMap in map!){
      itemMap['lgProduto'] = _convertToBool(itemMap['lgProduto']);
      itemMap['categoria'] = await _addCategoria(itemMap['categoriaId']);
      itemMap['lista'] = await _addLista(itemMap['listaId']);
    }
    return map;
  }
  
  bool _convertToBool(int value){
    return value == 0?false:true;
  }

  Future<Map<dynamic, dynamic>?> _addCategoria(int? categoriaId) async{
    if(categoriaId != null){
      return await categoriaDAO.get(categoriaId);
    }
    return null;
  }

  Future<Map<dynamic, dynamic>?> _addLista(int? listaId) async{
    if(listaId != null){
      return await listaDAO.get(listaId);
    }
    return null;
  }
}