import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class ItemRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<ItemModel>> findAll() async {
    return ItemModel.fromJsonArray(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/itens"
        }
      )
    ));
  }

  Future<ItemModel> create(ItemModel itemModel) async {
    return ItemModel.fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/itens"
        }
      ),
      itemModel
    ));
  }
 
  Future<ItemModel> update(ItemModel itemModel) async {
    return ItemModel.fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/itens"
        }
      ),
      itemModel
    ));
  }

  Future<ItemModel> remove(int id) async {
    return ItemModel.fromJson(await _repositoryManager.delete(
      ParameterRepository(
        data: {
          "path": "/itens/$id"
        }
      ),
    ));
  }
 
}