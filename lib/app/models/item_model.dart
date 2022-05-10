import 'package:lista_mercado_mobile/app/models/lista_model.dart';

class ItemModel{
  
  int id;
  String nmProduto;
  int qtProduto;
  bool lgProduto;
  
  ListaModel? lista;

  ItemModel(this.id, this.nmProduto, this.qtProduto, this.lgProduto, this.lista);

  
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      json['id'] ?? 0,
      json['nmProduto'],
      json['qtProduto'],
      json['lgProduto'] ?? false,
      json['lista']!=null?ListaModel.fromJson(json['lista']):null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmProduto'] = nmProduto;
    data['qtProduto'] = qtProduto;
    data['lgProduto'] = lgProduto;
    if(lista!=null){
      data['lista'] = lista!.toJson();
    }
    return data;
  }
  
  static fromJsonArray(List<dynamic> jsonArray) {
    List<ItemModel> list = List.empty(growable: true);
    for (var json in jsonArray) {
      list.add(ItemModel.fromJson(json));
    }
    return list;
  }
}