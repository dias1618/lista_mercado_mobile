import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';

class ListaUsadaModel{
  
  int? id;
  int? listaId;
  DateTime? dtUso;
  bool? lgFechada;
  
  List<ItemUsadoModel>? itensUsados;

  ListaUsadaModel([this.id, this.listaId, this.dtUso, this.lgFechada, this.itensUsados]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['listaId'] = listaId;
    data['dtUso'] = dtUso!.toIso8601String();
    data['lgFechada'] = lgFechada;
    return data;
  }
}