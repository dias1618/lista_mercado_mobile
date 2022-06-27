import 'package:flutter/material.dart';

class RotuloItensRestantes extends StatelessWidget {
  const RotuloItensRestantes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Text(
          'restantes',
          style: TextStyle(
            fontSize: 18.0,
          ),
        )
      )
    );
  }
}