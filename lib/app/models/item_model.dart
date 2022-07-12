import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/categoria_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/utils/entity_util.dart';

class ItemModel {
  int? id;
  String? nmProduto;
  int? qtProduto;
  bool? lgProduto;

  ListaModel? lista;
  CategoriaModel? categoria;

  ItemModel(
      [this.id,
      this.nmProduto,
      this.qtProduto,
      this.lgProduto,
      this.lista,
      this.categoria]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmProduto'] = nmProduto;
    data['qtProduto'] = qtProduto;
    data['lgProduto'] = lgProduto;
    data['lista'] = lista != null ? lista!.toJson() : null;
    data['categoria'] = categoria != null ? categoria!.toJson() : null;
    return data;
  }

  Map<String, dynamic> toJsonDatabase() {
    Map<String, dynamic> data = toJson();
    EntityUtil.replaceObjectToId(data, 'lista');
    EntityUtil.replaceObjectToId(data, 'categoria');
    data['lgProduto'] = EntityUtil.replaceBoolToInt(data, 'lgProduto');
    return data;
  }

  static toDatabaseJson(Map<String, dynamic> data) async {
    data['lgProduto'] = EntityUtil.replaceIntToBool(data, 'lgProduto');
    data['categoria'] = await EntityUtil.replaceIdToObject(data, data['categoriaId'], CategoriaDAO());
    data['lista'] = await EntityUtil.replaceIdToObject(data, data['listaId'], ListaDAO());
    return data;
  }
}
