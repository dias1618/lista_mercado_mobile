import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/lista_service.dart';

class ListaController extends Controller<ListaModel>{

  final ListaService _listaService = ListaService();

  @override
  Future delete(int id) {
    return _listaService.delete(id);
  }

  @override
  Future get(int id) {
    return _listaService.get(id);
  }

  @override
  Future post(ListaModel object) {
    return _listaService.insert(object);
  }

  @override
  Future put(ListaModel object) {
    return _listaService.update(object);
  }

  @override
  Future find(Map<String, dynamic>? query) {
    return _listaService.find(query);
  }

}