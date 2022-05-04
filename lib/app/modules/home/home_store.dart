import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  
  final ListaRepository listaRepository = Modular.get<ListaRepository>();
  
  @action
  HomeStoreBase() {
    load();
  }

  @observable
  ObservableList<ListaModel> listas = ObservableList.of([]);

  @action
  load() async {
    try{
      listas = ObservableList.of(await listaRepository.findAll());
    } on CustomException catch(error){
      EasyLoading.showError(error.message);
    }
  }

  String treatDataUltimoUso(ListaModel listaModel) {
    if(listaModel.dtUltimoUso == null) {
      return 'Nenhum uso';
    }
    return 'Último uso: ${DateFormat('dd/MM/yyyy').format(listaModel.dtUltimoUso!)}';
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