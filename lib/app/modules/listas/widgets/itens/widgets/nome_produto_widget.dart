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
      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0, right: 70.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          itemModel.nmProduto!, 
          style: TextStyle(
            decoration: (itemModel.lgProduto! ? TextDecoration.none : TextDecoration.lineThrough),
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: (itemModel.lgProduto! ? const Color.fromARGB(255, 29, 120, 76) : const Color.fromARGB(101, 189, 36, 25))
          )
        ),
      ),
    );
  }
}