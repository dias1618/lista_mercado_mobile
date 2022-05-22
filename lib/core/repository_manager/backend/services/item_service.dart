import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_dao.dart';

class ItemService{

  final ItemDAO itemDAO = ItemDAO();

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
    return data!;
  }

  find(Map<String, dynamic>? query) async {
    var ret =  await itemDAO.find(query);
    print(ret);
    return ret;
  }
}