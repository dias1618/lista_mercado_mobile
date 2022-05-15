// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorias_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriasStore on CategoriasStoreBase, Store {
  late final _$categoriasAtom =
      Atom(name: 'CategoriasStoreBase.categorias', context: context);

  @override
  ObservableList<CategoriaModel> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(ObservableList<CategoriaModel> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('CategoriasStoreBase.load', context: context);

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  @override
  String toString() {
    return '''
categorias: ${categorias}
    ''';
  }
}
