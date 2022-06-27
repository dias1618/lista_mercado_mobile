import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/item/item_builder.dart';
import 'package:lista_mercado_mobile/app/builders/item/item_list_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class ItemRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<ItemModel>> findAll() async {
    return ItemListBuilder().fromJson(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/itens"
        }
      )
    )).build();
  }

  Future<ItemModel> get(int id) async {
    return ItemBuilder().fromJson(await _repositoryManager.read(
      ParameterRepository(
        data: {
          "path": "/itens/$id",
          "table": "item",
          "primaryKey": {"id": id}
        }
      )
    )).build();
  }

  Future<ItemModel> create(ItemModel itemModel) async {
    return ItemBuilder().fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/itens",
          "table": "item",
        }
      ),
      itemModel
    )).build();
  }
 
  Future<ItemModel> update(ItemModel itemModel) async {
    return ItemBuilder().fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/itens",
          "table": "item",
        }
      ),
      itemModel
    )).build();
  }

  Future<void> remove(int id) async {
    return await _repositoryManager.delete(
      ParameterRepository(
        data: {
          "path": "/itens/$id",
          "table": "item",
          "primaryKey": id
        }
      ),
    );
  }
 
}