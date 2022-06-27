import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/categoria/categoria_builder.dart';
import 'package:lista_mercado_mobile/app/builders/categoria/categoria_list_builder.dart';
import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class CategoriaRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<CategoriaModel>> findAll() async {
    return CategoriaListBuilder().fromJson(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/categorias",
          "table": "categoria"
        }
      )
    )).build();
  }

  Future<CategoriaModel> create(CategoriaModel listaModel) async {
    return CategoriaBuilder().fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/categorias",
          "table": "categoria"
        }
      ),
      listaModel
    )).build();
  }
 
  Future<CategoriaModel> update(CategoriaModel listaModel) async {
    return CategoriaBuilder().fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/categorias",
          "table": "categoria"
        }
      ),
      listaModel
    )).build();
  }

  Future<void> remove(int id) async {
    return await _repositoryManager.delete(
      ParameterRepository(
        data: {
          "path": "/categorias/$id",
          "table": "categoria",
          "primaryKey": id
        }
      ),
    );
  }
}