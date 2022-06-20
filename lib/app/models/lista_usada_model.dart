import 'package:lista_mercado_mobile/app/models/item_usado_array_generate.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';

class ListaUsadaModel{
  
  int id;
  int listaId;
  DateTime dtUso;
  bool lgFechada;

  
  List<ItemUsadoModel> itensUsados;

  ListaUsadaModel(this.id, this.listaId, this.dtUso, this.lgFechada, this.itensUsados);

  
  factory ListaUsadaModel.fromJson(Map<String, dynamic> json) {
    return ListaUsadaModel(
      (json['id'] ?? 0),
      json['listaId'],
      DateTime.parse(json['dtUso']),
      json['lgFechada'] ?? false,
      (json['itensUsados'] != null ? ItemUsadoArrayGenerate.generate(json['itensUsados']) : []),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['listaId'] = listaId;
    data['dtUso'] = dtUso.toIso8601String();
    data['lgFechada'] = lgFechada;
    return data;
  }
  
  static fromJsonArray(List<dynamic> jsonArray) {
    List<ListaUsadaModel> list = List.empty(growable: true);
    for (var json in jsonArray) {
      list.add(ListaUsadaModel.fromJson(json));
    }
    return list;
  }
}