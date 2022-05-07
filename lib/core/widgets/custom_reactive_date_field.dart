import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDateField extends StatelessWidget {
  
  final String label;
  final String formControlName;
  final Map<String, String> validationMessages;
  final bool readOnly;
  
  const CustomReactiveDateField({ 
    Key? key,
    required this.label,
    required this.formControlName,
    this.validationMessages=const {},
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
        valueAccessor: DateTimeValueAccessor(
          dateTimeFormat: DateFormat('dd/MM/yyyy') ,
        ),
      )
    );
  }
}
