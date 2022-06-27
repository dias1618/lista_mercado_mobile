import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/lista/lista_builder.dart';
import 'package:lista_mercado_mobile/app/builders/lista/lista_list_builder.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class ListaRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<ListaModel>> findAll() async {
    return ListaListBuilder().fromJson(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/listas",
          "table": "lista",
        }
      )
    )).build();
  }

  Future<ListaModel> create(ListaModel listaModel) async {
    return ListaBuilder().fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/listas",
          "table": "lista",
        }
      ),
      listaModel
    )).build();
  }
 
  Future<ListaModel> update(ListaModel listaModel) async {
    return ListaBuilder().fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/listas",
          "table": "lista",
        }
      ),
      listaModel
    )).build();
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