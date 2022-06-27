import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/repositories/categoria_repository.dart';
import 'package:lista_mercado_mobile/app/repositories/item_repository.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListaRepository()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => ItemRepository()),
    Bind.lazySingleton((i) => CategoriaRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
