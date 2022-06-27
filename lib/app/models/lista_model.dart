import 'package:lista_mercado_mobile/app/models/item_model.dart';

class ListaModel{
  
  int? id;
  String? nmLista;
  
  List<ItemModel>? itens;

  ListaModel([this.id, this.nmLista, this.itens]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmLista'] = nmLista;
    return data;
  }

}