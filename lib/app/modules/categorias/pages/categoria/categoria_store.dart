import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/categoria/categoria_builder.dart';
import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/repositories/categoria_repository.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'categoria_store.g.dart';

class CategoriaStore = _CategoriaStoreBase with _$CategoriaStore;
abstract class _CategoriaStoreBase with Store {

  final CategoriaRepository categoriaRepository = Modular.get<CategoriaRepository>();

  @observable
  CategoriaModel? categoriaModel;

  final form = FormGroup({
    'id': FormControl<int>(),
    'nmCategoria': FormControl<String>(),
  });

  @action
  load(CategoriaModel? categoriaModel) async {
    this.categoriaModel = categoriaModel;
    if(this.categoriaModel != null){
      form.patchValue({
        'id': this.categoriaModel!.id,
        'nmCategoria': this.categoriaModel!.nmCategoria,
      });
    }
  }

  
  @action
  salvar(BuildContext context) async {
    try{
      categoriaModel = CategoriaBuilder().fromJson(form.value).build();
      if(categoriaModel!.id! > 0){
        categoriaModel = await categoriaRepository.update(categoriaModel!);
      } else {
        categoriaModel = await categoriaRepository.create(categoriaModel!);
      }
      EasyLoading.showSuccess('Categoria salva com sucesso!');
      Navigator.pop(context);
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  } 

  @action
  remover(BuildContext context) async {
    try{
      categoriaModel = CategoriaBuilder().fromJson(form.value).build();
      await categoriaRepository.remove(categoriaModel!.id!);
      EasyLoading.showSuccess('Categoria removida com sucesso!');
      Navigator.pop(context);
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

}