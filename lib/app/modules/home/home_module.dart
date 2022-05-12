import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/item/item_page.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/item/item_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_page.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/widgets/itens/item_widget_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista_usada/lista_usada_page.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista_usada/lista_usada_store.dart';
import 'package:lista_mercado_mobile/app/repositories/item_repository.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListaRepository()),
    Bind.lazySingleton((i) => ListaStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => ItemRepository()),
    Bind.lazySingleton((i) => ItemWidgetStore()),
    Bind.lazySingleton((i) => ItemStore()),
    Bind.lazySingleton((i) => ListaUsadaStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/listas', child: (_, args) => ListaPage(title: args.data['title'], lista: args.data['lista'],)),
    ChildRoute('/itens', child: (_, args) => ItemPage(title: args.data['title'], lista: args.data['lista'], item: args.data['item'],)),
    ChildRoute('/listausada', child: (_, args) => ListaUsada(lista: args.data['lista'])),
  ];
}
