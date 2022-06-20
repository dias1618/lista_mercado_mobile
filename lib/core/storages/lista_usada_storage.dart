import 'dart:collection';
import 'dart:convert';

import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/app/repositories/item_usado_repository.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_usada_repository.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaUsadaStorage{

  static final ListaUsadaRepository listaUsadaRepository = ListaUsadaRepository();
  static final ItemUsadoRepository itemUsadoRepository = ItemUsadoRepository();

  static Future<bool> isExist(ListaModel listaModel) async {
    Map<String, dynamic> query = HashMap<String, dynamic>();
    query['listaId'] = listaModel.id;
    query['lgFechada'] = 0;
    List<ListaUsadaModel> listasUsadas = await listaUsadaRepository.find(query);
    return listasUsadas.isNotEmpty;
  }

  static Future<ListaUsadaModel?> getListaUsada(int listaId) async {
    Map<String, dynamic> query = HashMap<String, dynamic>();
    query['listaId'] = listaId;
    query['lgFechada'] = 0;
    List<ListaUsadaModel> listasUsadas = await listaUsadaRepository.find(query);
    return listasUsadas.isNotEmpty ? listasUsadas.first : null;
  }

  static Future<ListaUsadaModel?> saveListaUsada(ListaUsadaModel listaUsadaModel) async {
    if(listaUsadaModel.id == 0){
      listaUsadaModel = await listaUsadaRepository.create(listaUsadaModel);
    }else{
      await listaUsadaRepository.update(listaUsadaModel);
      for (var item in listaUsadaModel.itensUsados) {
        await itemUsadoRepository.update(item);
      }
    }
    return getListaUsada(listaUsadaModel.listaId);
  }

  static Future<void> closeLista(ListaUsadaModel listaUsadaModel) async {
    listaUsadaModel.lgFechada = true;
    await listaUsadaRepository.update(listaUsadaModel);
  }

}