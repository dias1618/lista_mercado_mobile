import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';

class ListaUsadaBuilder{

  late ListaUsadaModel _listaUsada;

  ListaUsadaBuilder(int listaId){
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