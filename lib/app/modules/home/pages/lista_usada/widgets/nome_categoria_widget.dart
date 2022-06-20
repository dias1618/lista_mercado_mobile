import 'package:flutter/material.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';

class NomeCategoriaWidget extends StatelessWidget {

  final ItemUsadoModel itemUsado;

  const NomeCategoriaWidget({ 
    Key? key,
    required this.itemUsado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          (itemUsado.itemModel!.categoria != null ? itemUsado.itemModel!.categoria!.nmCategoria : 'Sem categoria'),
        ),
      ),
    );
  }
}