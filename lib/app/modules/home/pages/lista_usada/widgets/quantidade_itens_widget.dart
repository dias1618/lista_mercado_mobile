import 'package:flutter/material.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';

class QuantidadeItensWidget extends StatelessWidget {

  final ItemUsadoViewModel itemUsado;

  const QuantidadeItensWidget({ 
    Key? key,
    required this.itemUsado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
      child: Text(
        '${itemUsado.qtProduto}x',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }
}