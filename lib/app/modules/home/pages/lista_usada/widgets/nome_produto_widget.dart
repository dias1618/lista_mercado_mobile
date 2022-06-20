import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';

class NomeProdutoWidget extends StatelessWidget {

  final ItemUsadoModel itemUsado;

  const NomeProdutoWidget({ 
    Key? key,
    required this.itemUsado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          itemUsado.itemModel!.nmProduto, 
          style: TextStyle(
            decoration: (itemUsado.lgMarcado! ? TextDecoration.lineThrough : TextDecoration.none),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          )
        ),
      ),
    );
  }
}