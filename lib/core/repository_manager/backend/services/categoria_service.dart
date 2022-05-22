import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/categoria_dao.dart';

class CategoriaService{

  final CategoriaDAO categoriaDAO = CategoriaDAO();

  insert(CategoriaModel categoriaModel) async {
    Map<String, dynamic> data = categoriaModel.toJson();
    int id = await categoriaDAO.insert(data);
    categoriaModel.id = id;
    return categoriaModel.toJson();
  }

  update(CategoriaModel categoriaModel) async {
    Map<String, dynamic> data = categoriaModel.toJson();
    await categoriaDAO.update(data);
    return categoriaModel.toJson();
  }
  
  delete(int id) async {
    Map<dynamic, dynamic> data = (await categoriaDAO.get(id))!;
    await categoriaDAO.delete(id);
    return data;
  }

  get(int id) async {
    Map<dynamic, dynamic>? data = await categoriaDAO.get(id);
    return data!;
  }

  find(Map<String, dynamic>? query) async {
    return await categoriaDAO.find(query);
  }
}