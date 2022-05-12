import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';

class NomeProdutoWidget extends StatelessWidget {

  final ItemUsadoViewModel itemUsado;

  const NomeProdutoWidget({ 
    Key? key,
    required this.itemUsado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Observer(builder: (_) => Text(
            itemUsado.nmProduto, 
            style: TextStyle(
              decoration: (itemUsado.lgUsado ? TextDecoration.lineThrough : TextDecoration.none),
            )
          )
        ),
      ),
    );
  }
}