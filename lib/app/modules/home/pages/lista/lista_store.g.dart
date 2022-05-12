// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaStore on _ListaStoreBase, Store {
  late final _$listaModelAtom =
      Atom(name: '_ListaStoreBase.listaModel', context: context);

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

  late final _$salvarAsyncAction =
      AsyncAction('_ListaStoreBase.salvar', context: context);

  @override
  Future salvar(BuildContext context) {
    return _$salvarAsyncAction.run(() => super.salvar(context));
  }

  late final _$removerAsyncAction =
      AsyncAction('_ListaStoreBase.remover', context: context);

  @override
  Future remover(BuildContext context) {
    return _$removerAsyncAction.run(() => super.remover(context));
  }

  late final _$usarListaAsyncAction =
      AsyncAction('_ListaStoreBase.usarLista', context: context);

  @override
  Future usarLista(BuildContext context) {
    return _$usarListaAsyncAction.run(() => super.usarLista(context));
  }

  late final _$_ListaStoreBaseActionController =
      ActionController(name: '_ListaStoreBase', context: context);

  @override
  dynamic load(ListaModel? listaModel) {
    final _$actionInfo = _$_ListaStoreBaseActionController.startAction(
        name: '_ListaStoreBase.load');
    try {
      return super.load(listaModel);
    } finally {
      _$_ListaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaModel: ${listaModel}
    ''';
  }
}
