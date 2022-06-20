// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_usada_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaUsadaStore on _ListaUsadaStoreBase, Store {
  late final _$itensMarcadosAtom =
      Atom(name: '_ListaUsadaStoreBase.itensMarcados', context: context);

  @override
  int get itensMarcados {
    _$itensMarcadosAtom.reportRead();
    return super.itensMarcados;
  }

  @override
  set itensMarcados(int value) {
    _$itensMarcadosAtom.reportWrite(value, super.itensMarcados, () {
      super.itensMarcados = value;
    });
  }

  late final _$itensNaoMarcadosAtom =
      Atom(name: '_ListaUsadaStoreBase.itensNaoMarcados', context: context);

  @override
  int get itensNaoMarcados {
    _$itensNaoMarcadosAtom.reportRead();
    return super.itensNaoMarcados;
  }

  @override
  set itensNaoMarcados(int value) {
    _$itensNaoMarcadosAtom.reportWrite(value, super.itensNaoMarcados, () {
      super.itensNaoMarcados = value;
    });
  }

  late final _$loadItemsAsyncAction =
      AsyncAction('_ListaUsadaStoreBase.loadItems', context: context);

  @override
  Future<ObservableList<ItemUsadoModel>> loadItems(ListaModel? listaModel) {
    return _$loadItemsAsyncAction.run(() => super.loadItems(listaModel));
  }

  late final _$_ListaUsadaStoreBaseActionController =
      ActionController(name: '_ListaUsadaStoreBase', context: context);

  @override
  dynamic salvar() {
    final _$actionInfo = _$_ListaUsadaStoreBaseActionController.startAction(
        name: '_ListaUsadaStoreBase.salvar');
    try {
      return super.salvar();
    } finally {
      _$_ListaUsadaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fechar(BuildContext context) {
    final _$actionInfo = _$_ListaUsadaStoreBaseActionController.startAction(
        name: '_ListaUsadaStoreBase.fechar');
    try {
      return super.fechar(context);
    } finally {
      _$_ListaUsadaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itensMarcados: ${itensMarcados},
itensNaoMarcados: ${itensNaoMarcados}
    ''';
  }
}
