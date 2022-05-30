import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:lista_mercado_mobile/core/storages/lista_usada_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'lista_store.g.dart';

class ListaStore = _ListaStoreBase with _$ListaStore;
abstract class _ListaStoreBase with Store {

  final ListaRepository listaRepository = Modular.get<ListaRepository>();

  @observable
  ListaModel? listaModel;

  @observable
  int quantItensUsados=-1;

  final form = FormGroup({
    'id': FormControl<int>(),
    'nmLista': FormControl<String>(),
    'itens': FormControl<List<dynamic>>(),
  });

  @action
  load(ListaModel? listaModel) async {
    this.listaModel = listaModel;
    if(this.listaModel != null){
      form.patchValue({
        'id': this.listaModel!.id,
        'nmLista': this.listaModel!.nmLista,
      });
    }
    await getQuantItensUsados();
  }

  @action
  salvar(BuildContext context) async {
    try{
      listaModel = ListaModel.fromJson(form.value);
      if(listaModel!.id > 0){
        await listaRepository.update(listaModel!);
      } else {
        await listaRepository.create(listaModel!);
      }
      EasyLoading.showSuccess('Lista salva com sucesso!');
      Navigator.pop(context, listaModel);
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

  @action
  remover(BuildContext context) async {
    try{
      listaModel = ListaModel.fromJson(form.value);
      await listaRepository.remove(listaModel!.id);
      EasyLoading.showSuccess('Lista removida com sucesso!');
      Navigator.pop(context, listaModel);
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

  @action
  usarLista(BuildContext context) async{
    Navigator.of(context).pushNamed(
      '/listausada', 
      arguments: {
        'lista': listaModel
      }
    ).then((value){
      getQuantItensUsados();
    });
  }

  @action
  Future<int> getQuantItensUsados() async {
    quantItensUsados = -1;
    if((await ListaUsadaStorage.isExist(listaModel!))){
      quantItensUsados = 0;
      ObservableList<ItemUsadoViewModel> items = await ListaUsadaStorage.getListaUsada();
      for(ItemUsadoViewModel item in items){
        if(item.lgUsado){
          quantItensUsados++;
        }
      }
      return quantItensUsados;
    }
    return -1;
  } 

}