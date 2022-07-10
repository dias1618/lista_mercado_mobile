import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/lista_usada_page.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/lista_usada_store.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/lista_usada_service.dart';

class ListasUsadasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListaUsadaStore()),
    Bind.lazySingleton((i) => ListaUsadaService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ListaUsada(lista: args.data['lista'])),
  ];
}
