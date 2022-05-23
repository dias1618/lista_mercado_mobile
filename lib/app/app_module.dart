import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/core/repository_manager/dio_repository_manager.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';
import 'package:lista_mercado_mobile/core/repository_manager/sql_repository_manager.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<RepositoryManager>((i) => DioRepositoryManager())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
