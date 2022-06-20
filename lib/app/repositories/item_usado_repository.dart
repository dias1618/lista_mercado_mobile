import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_array_generate.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class ItemUsadoRepository {
  final _repositoryManager = Modular.get<RepositoryManager>();

  Future<List<ItemUsadoModel>> findAll() async {
    return ItemUsadoArrayGenerate.generate(await _repositoryManager.find(
      ParameterRepository(
        data: {
          "path": "/itensusados"
        }
      )
    ));
  }

  Future<ItemUsadoModel> get(int id) async {
    return ItemUsadoArrayGenerate.generate(await _repositoryManager.read(
      ParameterRepository(
        data: {
          "path": "/itensusados/$id",
          "table": "item_usado",
          "primaryKey": {"id": id}
        }
      )
    ));
  }

  Future<ItemUsadoModel> create(ItemUsadoModel itemModel) async {
    return ItemUsadoModel().fromJson(await _repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/itensusados",
          "table": "item_usado",
        }
      ),
      itemModel
    ));
  }
 
  Future<ItemUsadoModel> update(ItemUsadoModel itemModel) async {
    ItemUsadoModel itemUsadoModel = ItemUsadoModel();
    itemUsadoModel.fromJson(await _repositoryManager.update(
      ParameterRepository(
        data: {
          "path": "/itensusados",
          "table": "item_usado",
        }
      ),
      itemModel
    ));
    return itemUsadoModel;
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