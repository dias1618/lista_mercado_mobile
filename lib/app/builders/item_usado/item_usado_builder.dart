import 'package:lista_mercado_mobile/app/builders/item/item_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';

class ItemUsadoBuilder {
  late ItemUsadoModel _itemUsadoModel;

  ItemUsadoBuilder() {
    _itemUsadoModel = ItemUsadoModel();
  }

  ItemUsadoBuilder fromJson(Map<String, dynamic> json) {
    _itemUsadoModel.id = json['id'] ?? 0;
    _itemUsadoModel.listaUsadaId = json['listaUsadaId'];
    _itemUsadoModel.itemId = json['itemId'];
    _itemUsadoModel.lgMarcado = (json['lgMarcado'] == 0
        ? false
        : json['lgMarcado'] == 1
            ? true
            : json['lgMarcado'] ?? false);
    _itemUsadoModel.item = json['item'] != null
        ? ItemBuilder().fromJson(json['item']).build()
        : null;
    return this;
  }

  ItemUsadoModel build() {
    return _itemUsadoModel;
  }
}
