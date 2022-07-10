
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/lista_usada/lista_usada_inicial_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/app/services/lista_usada_service.dart';
import 'package:lista_mercado_mobile/core/modals/confirm_modal.dart';
import 'package:mobx/mobx.dart';

part 'lista_usada_store.g.dart';

class ListaUsadaStore = _ListaUsadaStoreBase with _$ListaUsadaStore;
abstract class _ListaUsadaStoreBase with Store {

  final ListaUsadaService listaUsadaService = Modular.get<ListaUsadaService>();

  late ListaUsadaModel? listaUsadaModel;
  ObservableList<ItemUsadoModel> items = ObservableList<ItemUsadoModel>();

  @observable
  int itensMarcados = 0;

  @observable
  int itensNaoMarcados = 0;

  @action
  Future<ObservableList<ItemUsadoModel>> loadItems(ListaModel? listaModel) async{
    items = ObservableList<ItemUsadoModel>();
    _initSumario();
    listaUsadaModel = await listaUsadaService.getListaUsada(listaModel!);
    listaUsadaModel ??= await listaUsadaService.createNewListaUsada(listaModel);
    listaUsadaModel!.itensUsados!.asMap().forEach((index, itemUsadoModel) {
      items.add(itemUsadoModel);
      _addSumario(itemUsadoModel);
    });
    return items;
  }

  @action
  salvar(){
    _initSumario();
    for(ItemUsadoModel item in listaUsadaModel!.itensUsados!){
      _addSumario(item);
    }
    listaUsadaService.saveListaUsada(listaUsadaModel!);
  }

  @action
  fechar(BuildContext context){
    ConfirmModal('Deseja realmente fechar essa lista?', _actionFechar).show(context);
  }

  _actionFechar(BuildContext context) async {
    listaUsadaModel!.lgFechada = true;
    listaUsadaService.saveListaUsada(listaUsadaModel!);
    Navigator.pop(context);
  }

  _initSumario(){
    itensMarcados = 0;
    itensNaoMarcados = 0;
  }

  _addSumario(ItemUsadoModel item){
    if(item.lgMarcado!){
      itensMarcados++;
    }
    else{
      itensNaoMarcados++;
    }
  }

}