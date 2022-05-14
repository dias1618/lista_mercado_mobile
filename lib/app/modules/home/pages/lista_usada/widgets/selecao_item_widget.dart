import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';

class SelecaoItemWidget extends StatelessWidget {
  
  final ItemUsadoViewModel itemUsado;
  final Function salvar;

  const SelecaoItemWidget({ 
    Key? key,
    required this.itemUsado,
    required this.salvar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => Checkbox(
      value: itemUsado.lgUsado,
      onChanged: (value){
        itemUsado.lgUsado = !itemUsado.lgUsado;
        salvar();
      },
    ));
  }
}