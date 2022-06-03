import 'package:flutter/material.dart';
import 'package:lista_mercado_mobile/core/formatters/uppercase_text_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField extends StatelessWidget {

  final String label;
  final String formControlName;
  final Map<String, String> validationMessages;
  final bool readOnly;

  const CustomReactiveTextField({ 
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
      child: ReactiveTextField(
        decoration: InputDecoration(
          labelText: label,
        ),
        formControlName: formControlName,
        validationMessages: (control) => validationMessages,
        readOnly: readOnly,
        inputFormatters: [
          UpperCaseTextFormatter()
        ],
      )
    );
  }
}