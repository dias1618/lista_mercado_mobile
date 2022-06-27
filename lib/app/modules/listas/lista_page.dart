import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/listas/lista_store.dart';
import 'package:lista_mercado_mobile/app/modules/listas/pages/edit_lista.dart';
import 'package:lista_mercado_mobile/app/modules/listas/pages/new_lista.dart';

class ListaPage extends StatefulWidget {
  final ListaModel? lista;

  const ListaPage({
    Key? key,
    this.lista
  }) : super(key: key);

  @override
  ListaPageState createState() => ListaPageState();
}
class ListaPageState extends ModularState<ListaPage, ListaStore> {
  
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.lista == null,
      child: const NewLista(),
      replacement: EditLista(lista: widget.lista, title: (widget.lista != null ? widget.lista!.nmLista! : '')),
    );
  }
}