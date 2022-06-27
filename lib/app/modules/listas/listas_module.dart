import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/listas/lista_page.dart';
import 'package:lista_mercado_mobile/app/modules/listas/lista_store.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/itens/item_widget_store.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';

class ListasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListaRepository()),
    Bind.lazySingleton((i) => ListaStore()),
    Bind.lazySingleton((i) => ItemWidgetStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ListaPage(lista: args.data['lista'],)),
  ];
}
