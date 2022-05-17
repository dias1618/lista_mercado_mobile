// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemStore on _ItemStoreBase, Store {
  late final _$itemModelAtom =
      Atom(name: '_ItemStoreBase.itemModel', context: context);

  @override
  ItemModel? get itemModel {
    _$itemModelAtom.reportRead();
    return super.itemModel;
  }

  @override
  set itemModel(ItemModel? value) {
    _$itemModelAtom.reportWrite(value, super.itemModel, () {
      super.itemModel = value;
    });
  }

  late final _$listaModelAtom =
      Atom(name: '_ItemStoreBase.listaModel', context: context);

  @override
  ListaModel? get listaModel {
    _$listaModelAtom.reportRead();
    return super.listaModel;
  }

  @override
  set listaModel(ListaModel? value) {
    _$listaModelAtom.reportWrite(value, super.listaModel, () {
      super.listaModel = value;
    });
  }

  late final _$categoriasAtom =
      Atom(name: '_ItemStoreBase.categorias', context: context);

  @override
  List<CategoriaModel> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(List<CategoriaModel> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('_ItemStoreBase.load', context: context);

  @override
  Future load(ListaModel? listaModel, ItemModel? itemModel) {
    return _$loadAsyncAction.run(() => super.load(listaModel, itemModel));
  }

  late final _$salvarAsyncAction =
      AsyncAction('_ItemStoreBase.salvar', context: context);

  @override
  Future salvar(BuildContext context) {
    return _$salvarAsyncAction.run(() => super.salvar(context));
  }

  late final _$removerAsyncAction =
      AsyncAction('_ItemStoreBase.remover', context: context);

  @override
  Future remover(BuildContext context) {
    return _$removerAsyncAction.run(() => super.remover(context));
  }

  @override
  String toString() {
    return '''
itemModel: ${itemModel},
listaModel: ${listaModel},
categorias: ${categorias}
    ''';
  }
}
