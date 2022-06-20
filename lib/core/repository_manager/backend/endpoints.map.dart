import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/categoria_controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/item_controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/item_usado_controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/lista_controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/lista_usada_controller.dart';

class EndpointsMap{
  Map<String, Controller> map = {
    'listas': ListaController(),
    'itens': ItemController(),
    'categorias': CategoriaController(),
    'listasusadas': ListaUsadaController(),
    'itensusados': ItemUsadoController(),
  };

  Controller get(String path){
    var pathParts = path.split('/');
    return map[pathParts[1]]!;
  }
}