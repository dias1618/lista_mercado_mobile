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

  
  fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    listaUsadaId = json['listaUsadaId'];
    itemId = json['itemId'];
    lgMarcado = (json['lgMarcado']==0 ? false : json['lgMarcado']==1 ? true : json['lgMarcado'] ?? false);
    itemModel = json['itemModel']!=null?ItemModel.fromJson(json['itemModel']):null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['listaUsadaId'] = listaUsadaId;
    data['itemId'] = itemId;
    data['lgMarcado'] = lgMarcado;
    if(itemModel!=null){
      data['itemModel'] = itemModel!.toJson();
    }
    return data;
  }
  
}