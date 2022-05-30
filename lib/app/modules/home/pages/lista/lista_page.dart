import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/pages/edit_lista.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/pages/new_lista.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/widgets/descricao_widget.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/widgets/itens/itens_widget.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';

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
      replacement: EditLista(lista: widget.lista, title: (widget.lista != null ? widget.lista!.nmLista : '')),
    );
  }
}