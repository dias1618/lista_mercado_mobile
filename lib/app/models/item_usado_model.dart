import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:mobx/mobx.dart';

part 'item_usado_model.g.dart';

class ItemUsadoModel = _ItemUsadoStoreBase with _$ItemUsadoModel;
abstract class _ItemUsadoStoreBase with Store {
  
  int? id;
  int? listaUsadaId;
  int? itemId;
  @observable
  bool? lgMarcado;
  
  ItemModel? itemModel;

  _ItemUsadoStoreBase([this.id, this.listaUsadaId, this.itemId, this.lgMarcado, this.itemModel]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['listaUsadaId'] = listaUsadaId;
    data['itemId'] = itemId;
    data['lgMarcado'] = lgMarcado;
    data['itemModel'] = itemModel!=null ? itemModel!.toJson() : null;
    return data;
  }
  
}