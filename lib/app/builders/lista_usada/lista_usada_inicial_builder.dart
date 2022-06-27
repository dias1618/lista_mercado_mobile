import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';

class ListaUsadaInicialBuilder{

  late ListaUsadaModel _listaUsada;

  ListaUsadaInicialBuilder(int listaId){
    _listaUsada = ListaUsadaModel(
      0,
      listaId,
      DateTime.now(),
      false,
      []
    );
  } 

  ListaUsadaModel build(){
    return _listaUsada;
  }
}