import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/item_usado/item_usado_builder.dart';
import 'package:lista_mercado_mobile/app/builders/item_usado/item_usado_list_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class ItemUsadoRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<ItemUsadoModel>> findAll() async {
    return ItemUsadoListBuilder().fromJson(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/itensusados"
        }
      )
    )).build();
  }

  Future<ItemUsadoModel> get(int id) async {
    return ItemUsadoBuilder().fromJson(await _repositoryManager.read(
      ParameterRepository(
        data: {
          "path": "/itensusados/$id",
          "table": "item_usado",
          "primaryKey": {"id": id}
        }
      )
    )).build();
  }

  Future<ItemUsadoModel> create(ItemUsadoModel itemModel) async {
    return ItemUsadoBuilder().fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/itensusados",
          "table": "item_usado",
        }
      ),
      itemModel
    )).build();
  }
 
  Future<ItemUsadoModel> update(ItemUsadoModel itemModel) async {
    return ItemUsadoBuilder().fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/itensusados",
          "table": "item_usado",
        }
      ),
      itemModel
    )).build();
  }

  Future<void> remove(int id) async {
    return await _repositoryManager.delete(
      ParameterRepository(
        data: {
          "path": "/itensusados/$id",
          "table": "item_usado",
          "primaryKey": id
        }
      ),
    );
  }
 
}