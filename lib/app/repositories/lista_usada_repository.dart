import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class ListaUsadaRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<ListaUsadaModel>> findAll() async {
    return ListaUsadaModel.fromJsonArray(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/listasusadas",
          "table": "lista_usada",
        }
      )
    ));
  }

  Future<ListaUsadaModel> create(ListaUsadaModel listaModel) async {
    return ListaUsadaModel.fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/listasusadas",
          "table": "lista_usada",
        }
      ),
      listaModel
    ));
  }
 
  Future<ListaUsadaModel> update(ListaUsadaModel listaModel) async {
    return ListaUsadaModel.fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/listasusadas",
          "table": "lista_usada",
        }
      ),
      listaModel
    ));
  }

  Future<void> remove(int id) async {
    return await _repositoryManager.delete(
      ParameterRepository(
        data: {
          "path": "/listasusadas/$id",
          "table": "lista_usada",
          "primaryKey": id
        }
      ),
    );
  }
 
  Future<List<ListaUsadaModel>> find(Map<String, dynamic> query) async {
    try{
      dynamic a = ListaUsadaModel.fromJsonArray(await _repositoryManager.find(
        ParameterRepository(
          data: {
            "path": "/listasusadas",
            "table": "lista_usada",
            "query": query
          }
        ),
      ));
      return a;
    } catch(error){
      print(error.toString());
      return [];
    }
    
  }
 
}