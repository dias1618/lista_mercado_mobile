import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/itens/item_page.dart';
import 'package:lista_mercado_mobile/app/modules/itens/item_store.dart';
import 'package:lista_mercado_mobile/app/modules/listas/widgets/itens/item_widget_store.dart';
import 'package:lista_mercado_mobile/app/repositories/item_repository.dart';

class ItensModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ItemRepository()),
    Bind.lazySingleton((i) => ItemWidgetStore()),
    Bind.lazySingleton((i) => ItemStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ItemPage(title: args.data['title'], lista: args.data['lista'], item: args.data['item'],)),
  ];
}
