import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/lista_usada_service.dart';

class ListaUsadaController extends Controller<ListaUsadaModel>{

  final ListaUsadaService _listaUsadaService = ListaUsadaService();

  @override
  Future delete(int id) {
    return _listaUsadaService.delete(id);
  }

  @override
  Future get(int id) {
    return _listaUsadaService.get(id);
  }

  @override
  Future post(ListaUsadaModel object) {
    return _listaUsadaService.insert(object);
  }

  @override
  Future put(ListaUsadaModel object) {
    return _listaUsadaService.update(object);
  }

  @override
  Future find(Map<String, dynamic>? query) async {
    return await _listaUsadaService.find(query);
  }

}