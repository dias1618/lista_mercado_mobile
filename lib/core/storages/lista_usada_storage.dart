import 'dart:convert';

import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaUsadaStorage{

  static Future<bool> isExist(ListaModel listaModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('lista') && prefs.getInt('lista') == listaModel.id;
  }

  static Future<ObservableList<ItemUsadoViewModel>> getListaUsada() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString('lista_usada');
    var lista = const JsonDecoder().convert(json!);
    ObservableList<ItemUsadoViewModel> items = ObservableList<ItemUsadoViewModel>.of([]);
    for(Map<String, dynamic> item in lista){
      items.add(ItemUsadoViewModelBuilder(item).build()!);
    }
    return items;
  }

  static Future<void> saveListaUsada(ObservableList<ItemUsadoViewModel> items) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> lista = List.empty(growable: true);
    for (var item in items) {
      prefs.setInt('lista', item.lista!.id);
      lista.add(item.toJson());
    }
    prefs.setString('lista_usada', const JsonEncoder().convert(lista));
  }

  static Future<void> clearLista() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('lista_usada');
    prefs.remove('lista');
  }

}