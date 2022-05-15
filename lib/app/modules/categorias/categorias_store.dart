import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/repositories/categoria_repository.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:mobx/mobx.dart';

part 'categorias_store.g.dart';

class CategoriasStore = CategoriasStoreBase with _$CategoriasStore;

abstract class CategoriasStoreBase with Store {
  final CategoriaRepository categoriaRepository = Modular.get<CategoriaRepository>();

  @observable
  ObservableList<CategoriaModel> categorias = ObservableList.of([]);

  @action
  CategoriasStoreBase() {
    load();
  }
  
  @action
  load() async {
    try{
      categorias = ObservableList.of(await categoriaRepository.findAll());
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

  void navigateCategoria(BuildContext context, CategoriaModel categoriaModel) async {
    Navigator.of(context).pushNamed(
      '/listacategorias/categorias/', 
      arguments: {
        'title': categoriaModel.nmCategoria, 
        'categoria': categoriaModel
      }
    ).then((value){
      load();
    });
  }

  void newCategoria(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/listacategorias/categorias/', 
      arguments: {
        'title': 'Nova categorias'
      }
    ).then((value){
      load();
    });
  }
}