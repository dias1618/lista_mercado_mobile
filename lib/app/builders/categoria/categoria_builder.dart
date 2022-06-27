import 'package:lista_mercado_mobile/app/models/categoria_model.dart';

class CategoriaBuilder{
  late CategoriaModel _categoriaModel;

  CategoriaBuilder(){
    _categoriaModel = CategoriaModel();
  }

  CategoriaBuilder fromJson(Map<String, dynamic> json){
    _categoriaModel.id = json['id'] ?? 0;
    _categoriaModel.nmCategoria = json['nmCategoria'];
    return this;
  }

  CategoriaModel build(){
    return _categoriaModel;
  }
}