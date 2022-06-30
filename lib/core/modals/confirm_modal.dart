import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ConfirmModal{

  String title;
  Function onClick;

  ConfirmModal(this.title, this.onClick);

  show(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      headerAnimationLoop: false,
      title: 'Confirmação',
      desc: title,
      buttonsTextStyle: const TextStyle(color: Colors.white),
      showCloseIcon: true,
      btnCancelOnPress: () {
        
      },
      btnOkOnPress: () async {
        onClick(context);
      },
    ).show();
  }

}