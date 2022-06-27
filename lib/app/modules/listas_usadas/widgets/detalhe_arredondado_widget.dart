import 'package:flutter/material.dart';

class DetalheArredondado extends StatelessWidget {
  const DetalheArredondado({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          )
        ),
      ),
    );
  }
}