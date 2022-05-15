// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaStore on _CategoriaStoreBase, Store {
  late final _$categoriaModelAtom =
      Atom(name: '_CategoriaStoreBase.categoriaModel', context: context);

  @override
  CategoriaModel? get categoriaModel {
    _$categoriaModelAtom.reportRead();
    return super.categoriaModel;
  }

  @override
  set categoriaModel(CategoriaModel? value) {
    _$categoriaModelAtom.reportWrite(value, super.categoriaModel, () {
      super.categoriaModel = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('_CategoriaStoreBase.load', context: context);

  @override
  Future load(CategoriaModel? categoriaModel) {
    return _$loadAsyncAction.run(() => super.load(categoriaModel));
  }

  late final _$salvarAsyncAction =
      AsyncAction('_CategoriaStoreBase.salvar', context: context);

  @override
  Future salvar(BuildContext context) {
    return _$salvarAsyncAction.run(() => super.salvar(context));
  }

  late final _$removerAsyncAction =
      AsyncAction('_CategoriaStoreBase.remover', context: context);

  @override
  Future remover(BuildContext context) {
    return _$removerAsyncAction.run(() => super.remover(context));
  }

  @override
  String toString() {
    return '''
categoriaModel: ${categoriaModel}
    ''';
  }
}
