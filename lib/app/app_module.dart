import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/categorias/categorias_module.dart';
import 'package:lista_mercado_mobile/app/modules/itens/itens_module.dart';
import 'package:lista_mercado_mobile/app/modules/listas/listas_module.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/listas_usadas_module.dart';
import 'package:lista_mercado_mobile/core/repository_manager/dio_repository_manager.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';
import 'package:lista_mercado_mobile/core/repository_manager/sql_repository_manager.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<RepositoryManager>((i) => SqlRepositoryManager())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/listas', module: ListasModule()),
    ModuleRoute('/itens', module: ItensModule()),
    ModuleRoute('/categorias/', module: CategoriasModule()),
    ModuleRoute('/listasusadas/', module: ListasUsadasModule()),
  ];
}
