import 'dart:collection';

import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/app/repositories/item_usado_repository.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_usada_repository.dart';

class ListaUsadaStorage{

  static final ListaUsadaRepository listaUsadaRepository = ListaUsadaRepository();
  static final ItemUsadoRepository itemUsadoRepository = ItemUsadoRepository();

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
      await _updateItens(listaUsadaModel);  
    }
    return getListaUsada(listaUsadaModel.listaId!);
  }

  static _updateItens(ListaUsadaModel listaUsadaModel) async {
    for (var item in listaUsadaModel.itensUsados!) {
      await itemUsadoRepository.update(item);
    }
  }

  static Future<void> closeLista(ListaUsadaModel listaUsadaModel) async {
    listaUsadaModel.lgFechada = true;
    await listaUsadaRepository.update(listaUsadaModel);
  }

}