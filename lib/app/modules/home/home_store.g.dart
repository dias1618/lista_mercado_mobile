// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$listasAtom =
      Atom(name: 'HomeStoreBase.listas', context: context);

  @override
  ObservableList<ListaModel> get listas {
    _$listasAtom.reportRead();
    return super.listas;
  }

  @override
  set listas(ObservableList<ListaModel> value) {
    _$listasAtom.reportWrite(value, super.listas, () {
      super.listas = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('HomeStoreBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  @override
  String toString() {
    return '''
listas: ${listas}
    ''';
  }
}
