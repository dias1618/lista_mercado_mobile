import 'package:lista_mercado_mobile/app/builders/item/item_list_builder.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';

class ListaBuilder{
  late ListaModel _listaModel;

  ListaBuilder(){
    _listaModel = ListaModel();
  }

  ListaBuilder fromJson(Map<String, dynamic> json){
    _listaModel.id = json['id'] ?? 0;
    _listaModel.nmLista = json['nmLista'];
    _listaModel.itens = json['itens']!=null?ItemListBuilder().fromJson(json['itens']).build():null;
    return this;
  }

  ListaModel build(){
    return _listaModel;
  }
}