import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String label;
  final Function onPressed;
  final Color color;

  const CustomButton({ 
    Key? key,
    required this.label,
    required this.onPressed,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), 
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          primary: color
        ),
        onPressed: (){
          onPressed(context);
        }, 
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white
          ),
        )
      )
    );
  }
}