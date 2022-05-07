import 'package:flutter/material.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';

class NomeProdutoWidget extends StatelessWidget {

  final ItemModel itemModel;

  const NomeProdutoWidget({ 
    Key? key,
    required this.itemModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          itemModel.nmProduto,
        ),
      ),
    );
  }
}