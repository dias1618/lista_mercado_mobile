import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/categoria_service.dart';

class CategoriaController extends Controller<CategoriaModel>{

  final CategoriaService _categoriaService = CategoriaService();

  @override
  Future delete(int id) {
    return _categoriaService.delete(id);
  }

  @override
  Future get(int id) {
    return _categoriaService.get(id);
  }

  @override
  Future post(CategoriaModel object) {
    return _categoriaService.insert(object);
  }

  @override
  Future put(CategoriaModel object) {
    return _categoriaService.update(object);
  }

  @override
  Future find(Map<String, dynamic>? query) {
    return _categoriaService.find(query);
  }

}