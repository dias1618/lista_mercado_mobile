import 'package:intl/intl.dart';

class CustomDateUtils{
  static String convertStringPtBrToIso(String date){
    return DateFormat('dd/MM/yyyy').parse(date).toIso8601String();
  }
}