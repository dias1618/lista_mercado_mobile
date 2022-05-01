import 'package:lista_mercado_mobile/app/models/item_model.dart';

class ListaModel{
  
  int id;
  String nmLista;
  DateTime? dtUltimoUso;
  
  List<ItemModel> itens;

  ListaModel(this.id, this.nmLista, this.dtUltimoUso, this.itens);

  
  factory ListaModel.fromJson(Map<String, dynamic> json) {
    return ListaModel(
      json['id'],
      json['nmLista'],
      (json['dtUltimoUso'] != null ? DateTime.parse(json['dtUltimoUso']) : null),
      ItemModel.fromJsonArray(json['itens']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmLista'] = nmLista;
    data['dtUltimoUso'] = dtUltimoUso?.toIso8601String();
    data['itens'] = ItemModel.fromJsonArray(itens);
    return data;
  }
  
  static fromJsonArray(List<dynamic> jsonArray) {
    print('chega aqui');
    List<ListaModel> list = List.empty(growable: true);
    for (var json in jsonArray) {
      list.add(ListaModel.fromJson(json));
    }
    return list;
  }
}