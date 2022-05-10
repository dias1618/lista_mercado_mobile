import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveCheckField extends StatelessWidget {

  final String label;
  final String formControlName;
  final Map<String, String> validationMessages;
  final bool readOnly;

  const CustomReactiveCheckField({ 
    Key? key,
    required this.label,
    required this.formControlName,
    required this.validationMessages,
    this.readOnly=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), 
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ReactiveCheckbox(
              formControlName: formControlName,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(label),
          ),
        ]
      )
    );
  }
}