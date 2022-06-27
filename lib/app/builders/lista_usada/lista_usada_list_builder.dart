
import 'package:lista_mercado_mobile/app/builders/lista_usada/lista_usada_builder.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';

class ListaUsadaListBuilder{
  late List<ListaUsadaModel> listListaUsada;

  ListaUsadaListBuilder(){
    listListaUsada = List.empty(growable: true);
  }

  ListaUsadaListBuilder fromJson(List<dynamic> json){
    for (var jsonListaUsada in json) {
      ListaUsadaModel lista = ListaUsadaBuilder().fromJson(jsonListaUsada).build();
      listListaUsada.add(lista);
    }
    return this;
  }

  List<ListaUsadaModel> build(){
    return listListaUsada;
  }
}