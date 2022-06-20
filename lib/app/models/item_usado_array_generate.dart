import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';

class ItemUsadoArrayGenerate{
  
  static generate(List<dynamic> jsonArray) {
    List<ItemUsadoModel> list = List.empty(growable: true);
    for (var json in jsonArray) {
      ItemUsadoModel itemUsado = ItemUsadoModel();
      itemUsado.fromJson(json);
      list.add(itemUsado);
    }
    return list;
  }

}