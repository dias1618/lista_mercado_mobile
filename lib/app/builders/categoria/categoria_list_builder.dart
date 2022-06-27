
import 'package:lista_mercado_mobile/app/builders/categoria/categoria_builder.dart';
import 'package:lista_mercado_mobile/app/models/categoria_model.dart';

class CategoriaListBuilder{
  late List<CategoriaModel> listCategoria;

  CategoriaListBuilder(){
    listCategoria = List.empty(growable: true);
  }

  CategoriaListBuilder fromJson(List<dynamic> json){
    for (var jsonCategoria in json) {
      CategoriaModel categoria = CategoriaBuilder().fromJson(jsonCategoria).build();
      listCategoria.add(categoria);
    }
    return this;
  }

  List<CategoriaModel> build(){
    return listCategoria;
  }
}