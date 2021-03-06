
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

  final TextEditingController pesquisaController = TextEditingController();

  final ListaUsadaService listaUsadaService = Modular.get<ListaUsadaService>();

  late ListaUsadaModel? listaUsadaModel;

  ObservableList<ItemUsadoModel> items = ObservableList<ItemUsadoModel>();
  ObservableList<bool> visualizationItems = ObservableList<bool>();

  @observable
  int itensMarcados = 0;

  @observable
  int itensNaoMarcados = 0;

  @action
  Future<ObservableList<ItemUsadoModel>> loadItems(ListaModel? listaModel) async{
    pesquisaController.addListener(_changeFilter);
    items = ObservableList<ItemUsadoModel>();
    visualizationItems = ObservableList<bool>();
    _initSumario();
    listaUsadaModel = await listaUsadaService.getListaUsada(listaModel!);
    listaUsadaModel ??= await listaUsadaService.createNewListaUsada(listaModel);
    listaUsadaModel!.itensUsados!.asMap().forEach((index, itemUsadoModel) {
      items.add(itemUsadoModel);
      visualizationItems.add(true);
      _addSumario(itemUsadoModel);
    });
    return items;
  }

  @action
  _changeFilter(){
    for(int i = 0; i < items.length; i++){
      ItemUsadoModel itemUsado = items[i];
      if(itemUsado.item!.nmProduto!.startsWith(pesquisaController.text)){
        visualizationItems[i]=true;
      }
      else{
        visualizationItems[i]=false;
      }
    }
    print(visualizationItems);
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