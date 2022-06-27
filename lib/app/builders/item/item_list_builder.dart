
import 'package:lista_mercado_mobile/app/builders/item/item_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';

class ItemListBuilder{
  late List<ItemModel> listItem;

  ItemListBuilder(){
    listItem = List.empty(growable: true);
  }

  ItemListBuilder fromJson(List<dynamic> json){
    for (var jsonItem in json) {
      ItemModel item = ItemBuilder().fromJson(jsonItem).build();
      listItem.add(item);
    }
    return this;
  }

  List<ItemModel> build(){
    return listItem;
  }
}