import 'package:flutter/material.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';

class QuantidadeItensWidget extends StatelessWidget {

  final ItemModel itemModel;

  const QuantidadeItensWidget({ 
    Key? key,
    required this.itemModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 30.0),
      child: Text(
        '${itemModel.qtProduto}x',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
          color: (itemModel.lgProduto ? const Color.fromARGB(255, 29, 120, 76) : const Color.fromARGB(101, 189, 36, 25))
        ),
      ),
    );
  }
}