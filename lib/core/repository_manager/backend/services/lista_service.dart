import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_dao.dart';

class ListaService{

  final ListaDAO listaDAO = ListaDAO();

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
    return data;
  }

  get(int id) async {
    Map<dynamic, dynamic>? data = await listaDAO.get(id);
    return data!;
  }

  find(Map<String, dynamic>? query) async {
    var ret = await listaDAO.find(query);
    print(ret);
    return ret;
  }
}