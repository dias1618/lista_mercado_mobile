import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_page.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListaRepository()),
    Bind.lazySingleton((i) => ListaStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/listas', child: (_, args) => ListaPage(title: args.data['title'], lista: args.data['lista'],)),
  ];
}
