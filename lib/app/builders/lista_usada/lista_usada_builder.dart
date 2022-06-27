import 'package:lista_mercado_mobile/app/builders/item/item_list_builder.dart';
import 'package:lista_mercado_mobile/app/builders/item_usado/item_usado_list_builder.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';

class ListaUsadaBuilder{
  late ListaUsadaModel _listaModel;

  ListaUsadaBuilder(){
    _listaModel = ListaUsadaModel();
  }

  ListaUsadaBuilder fromJson(Map<String, dynamic> json){
    _listaModel.id = json['id'] ?? 0;
    _listaModel.listaId = json['listaId'];
    _listaModel.dtUso = DateTime.parse(json['dtUso']);
    _listaModel.lgFechada = json['lgFechada'];
    _listaModel.itensUsados = json['itensUsados']!=null?ItemUsadoListBuilder().fromJson(json['itensUsados']).build():null;
    return this;
  }

  ListaUsadaModel build(){
    return _listaModel;
  }
}