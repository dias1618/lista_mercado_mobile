// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_usada_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaUsadaStore on _ListaUsadaStoreBase, Store {
  late final _$itensUsadosAtom =
      Atom(name: '_ListaUsadaStoreBase.itensUsados', context: context);

  @override
  int get itensUsados {
    _$itensUsadosAtom.reportRead();
    return super.itensUsados;
  }

  @override
  set itensUsados(int value) {
    _$itensUsadosAtom.reportWrite(value, super.itensUsados, () {
      super.itensUsados = value;
    });
  }

  late final _$itensNaoUsadosAtom =
      Atom(name: '_ListaUsadaStoreBase.itensNaoUsados', context: context);

  @override
  int get itensNaoUsados {
    _$itensNaoUsadosAtom.reportRead();
    return super.itensNaoUsados;
  }

  @override
  set itensNaoUsados(int value) {
    _$itensNaoUsadosAtom.reportWrite(value, super.itensNaoUsados, () {
      super.itensNaoUsados = value;
    });
  }

  late final _$loadItemsAsyncAction =
      AsyncAction('_ListaUsadaStoreBase.loadItems', context: context);

  @override
  Future<ObservableList<ItemUsadoViewModel>> loadItems(ListaModel? listaModel) {
    return _$loadItemsAsyncAction.run(() => super.loadItems(listaModel));
  }

  late final _$_ListaUsadaStoreBaseActionController =
      ActionController(name: '_ListaUsadaStoreBase', context: context);

  @override
  dynamic salvar(ItemUsadoViewModel item) {
    final _$actionInfo = _$_ListaUsadaStoreBaseActionController.startAction(
        name: '_ListaUsadaStoreBase.salvar');
    try {
      return super.salvar(item);
    } finally {
      _$_ListaUsadaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itensUsados: ${itensUsados},
itensNaoUsados: ${itensNaoUsados}
    ''';
  }
}
