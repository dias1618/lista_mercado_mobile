
import 'package:lista_mercado_mobile/app/builders/lista/lista_builder.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';

class ListaListBuilder{
  late List<ListaModel> listLista;

  ListaListBuilder(){
    listLista = List.empty(growable: true);
  }

  ListaListBuilder fromJson(List<dynamic> json){
    for (var jsonLista in json) {
      ListaModel lista = ListaBuilder().fromJson(jsonLista).build();
      listLista.add(lista);
    }
    return this;
  }

  List<ListaModel> build(){
    return listLista;
  }
}