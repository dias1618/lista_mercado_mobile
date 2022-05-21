import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class ListaRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<ListaModel>> findAll() async {
    return ListaModel.fromJsonArray(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/listas",
          "table": "lista",
        }
      )
    ));
  }

  Future<ListaModel> create(ListaModel listaModel) async {
    return ListaModel.fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/listas",
          "table": "lista",
        }
      ),
      listaModel
    ));
  }
 
  Future<ListaModel> update(ListaModel listaModel) async {
    return ListaModel.fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/listas",
          "table": "lista",
        }
      ),
      listaModel
    ));
  }

  Future<void> remove(int id) async {
    return await _repositoryManager.delete(
      ParameterRepository(
        data: {
          "path": "/listas/$id",
          "table": "lista",
          "primaryKey": id
        }
      ),
    );
  }
 
}