import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_usada_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/utils/entity_util.dart';
import 'package:mobx/mobx.dart';

part 'item_usado_model.g.dart';

class ItemUsadoModel = _ItemUsadoStoreBase with _$ItemUsadoModel;

abstract class _ItemUsadoStoreBase with Store {
  int? id;
  int? listaUsadaId;
  int? itemId;
  @observable
  bool? lgMarcado;

  ItemModel? item;

  _ItemUsadoStoreBase(
      [this.id, this.listaUsadaId, this.itemId, this.lgMarcado, this.item]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['listaUsadaId'] = listaUsadaId;
    data['itemId'] = itemId;
    data['lgMarcado'] = lgMarcado;
    data['item'] = item != null ? item!.toJson() : null;
    return data;
  }

  Map<String, dynamic> toJsonDatabase() {
    Map<String, dynamic> data = toJson();
    EntityUtil.replaceObjectToId(data, 'listaUsada');
    EntityUtil.replaceObjectToId(data, 'item');
    data['lgMarcado'] = EntityUtil.replaceBoolToInt(data, 'lgMarcado');
    return data;
  }

  toDatabaseJson(Map<String, dynamic> data) async {
    data['lgMarcado'] = EntityUtil.replaceIntToBool(data, 'lgMarcado');
    data['listaUsada'] = await EntityUtil.replaceIdToObject(
        data, data['listaUsadaId'], ListaUsadaDAO());
    data['item'] =
        await EntityUtil.replaceIdToObject(data, data['itemId'], ItemDAO());
    return data;
  }
}
