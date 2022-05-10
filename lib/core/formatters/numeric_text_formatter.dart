import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.isNotEmpty) {
      int num = int.parse(newValue.text.replaceAll(',', ''));
      final f = NumberFormat("#,###");
      return newValue.copyWith(text: f.format(num));
    } else { 
      return newValue.copyWith(text: '');
    }
  }
}