import 'dart:collection';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/lista_usada/lista_usada_inicial_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/app/repositories/item_usado_repository.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_usada_repository.dart';

class ListaUsadaService{

  final ListaUsadaRepository listaUsadaRepository = Modular.get<ListaUsadaRepository>();
  final ItemUsadoRepository itemUsadoRepository = Modular.get<ItemUsadoRepository>();

  Future<ListaUsadaModel?> getListaUsada(ListaModel? listaModel) async {
    Map<String, dynamic> query = HashMap<String, dynamic>();
    query['listaId'] = listaModel!.id;
    query['lgFechada'] = 0;
    List<ListaUsadaModel> listasUsadas = await listaUsadaRepository.find(query);
    return listasUsadas.isNotEmpty ? listasUsadas.first : null;
  }

  Future<ListaUsadaModel> createNewListaUsada(ListaModel? listaModel) async {
    ListaUsadaModel listaUsadaModel = ListaUsadaInicialBuilder(listaModel!.id!).build();
    listaUsadaModel = _addItensAtivos(listaUsadaModel, listaModel);
    return await saveListaUsada(listaUsadaModel);
  }

  ListaUsadaModel _addItensAtivos(ListaUsadaModel listaUsadaModel, ListaModel listaModel) {
    listaModel.itens!.asMap().forEach((index, itemModel) {
      if(itemModel.lgProduto!){
        ItemUsadoModel itemUsadoModel = ItemUsadoModel(0, 0, itemModel.id, false, itemModel);
        listaUsadaModel.itensUsados!.add(itemUsadoModel);
      }
    });
    return listaUsadaModel;
  }

  Future<ListaUsadaModel> saveListaUsada(ListaUsadaModel listaUsadaModel) async {
    if(listaUsadaModel.id == 0){
      listaUsadaModel.id = (await listaUsadaRepository.create(listaUsadaModel)).id;
    }else{
      await listaUsadaRepository.update(listaUsadaModel);
      await _updateItens(listaUsadaModel);  
    }
    return listaUsadaModel;
  }

  _updateItens(ListaUsadaModel listaUsadaModel) async {
    for (var item in listaUsadaModel.itensUsados!) {
      await itemUsadoRepository.update(item);
    }
  }

  Future<void> closeLista(ListaUsadaModel listaUsadaModel) async {
    listaUsadaModel.lgFechada = true;
    await listaUsadaRepository.update(listaUsadaModel);
  }

}