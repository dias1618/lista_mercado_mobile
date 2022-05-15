
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/categorias/categorias_page.dart';
import 'package:lista_mercado_mobile/app/modules/categorias/categorias_store.dart';
import 'package:lista_mercado_mobile/app/modules/categorias/pages/categoria/categoria_page.dart';
import 'package:lista_mercado_mobile/app/modules/categorias/pages/categoria/categoria_store.dart';
import 'package:lista_mercado_mobile/app/repositories/categoria_repository.dart';

class CategoriasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoriasStore()),
    Bind.lazySingleton((i) => CategoriaRepository()),
    Bind.lazySingleton((i) => CategoriaStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CategoriasPage()),
    ChildRoute('/categorias/', child: (_, args) => CategoriaPage(title: args.data['title'], categoria: args.data['categoria'],)),
  ];
}
