import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:lista_mercado_mobile/core/storages/lista_usada_storage.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  
  final ListaRepository listaRepository = Modular.get<ListaRepository>();

  @observable
  ObservableList<ListaModel> listas = ObservableList.of([]);

  @action
  HomeStoreBase() {
    ListaUsadaStorage.clearLista();
    load();
  }
  
  @action
  load() async {
    try{
      listas = ObservableList.of(await listaRepository.findAll());
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

  void navigateLista(BuildContext context, ListaModel listaModel) async {
    Navigator.of(context).pushNamed(
      '/listas', 
      arguments: {
        'title': listaModel.nmLista, 
        'lista': listaModel
      }
    ).then((value){
      load();
    });
  }

  void newLista(BuildContext context) async {
    Navigator.of(context).pushNamed(
      '/listas', 
      arguments: {
        'title': 'Nova lista'
      }
    ).then((value){
      load();
    });
  }
}