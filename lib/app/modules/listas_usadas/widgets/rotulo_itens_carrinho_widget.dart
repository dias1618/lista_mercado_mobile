import 'package:flutter/material.dart';

class RotuloItensCarrinho extends StatelessWidget {
  const RotuloItensCarrinho({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          'no carrinho',
          style: TextStyle(
            fontSize: 18.0,
          ),
        )
      )
    );
  }
}