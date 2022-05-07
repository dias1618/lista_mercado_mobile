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
      padding: const EdgeInsets.all(10.0),
      child: Text(
        '${itemModel.qtProduto} item(s)',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}