// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemStore on _ItemStoreBase, Store {
  late final _$itemsAtom = Atom(name: '_ItemStoreBase.items', context: context);

  @override
  ObservableList<dynamic> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<dynamic> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
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

  late final _$removeAsyncAction =
      AsyncAction('_ItemStoreBase.remove', context: context);

  @override
  Future remove(ItemModel itemModel) {
    return _$removeAsyncAction.run(() => super.remove(itemModel));
  }

  late final _$_ItemStoreBaseActionController =
      ActionController(name: '_ItemStoreBase', context: context);

  @override
  dynamic load(ListaModel? listaModel) {
    final _$actionInfo = _$_ItemStoreBaseActionController.startAction(
        name: '_ItemStoreBase.load');
    try {
      return super.load(listaModel);
    } finally {
      _$_ItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
listaModel: ${listaModel}
    ''';
  }
}
