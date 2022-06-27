import 'package:lista_mercado_mobile/app/builders/item_usado/item_usado_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';

class ItemUsadoListBuilder{
  late List<ItemUsadoModel> listItemUsado;

  ItemUsadoListBuilder(){
    listItemUsado = List.empty(growable: true);
  }

  ItemUsadoListBuilder fromJson(List<dynamic> json){
    for (var jsonItem in json) {
      ItemUsadoModel itemUsado = ItemUsadoBuilder().fromJson(jsonItem).build();
      listItemUsado.add(itemUsado);
    }
    return this;
  }

  List<ItemUsadoModel> build(){
    return listItemUsado;
  }
}