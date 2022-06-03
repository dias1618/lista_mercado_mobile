import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista_usada/lista_usada_store.dart';

class ValorItensCarrinho extends StatefulWidget {
  const ValorItensCarrinho({ Key? key }) : super(key: key);

  @override
  State<ValorItensCarrinho> createState() => _ValorItensCarrinhoState();
}

class _ValorItensCarrinhoState extends ModularState<ValorItensCarrinho, ListaUsadaStore> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10.0),
          child: Observer(
            builder: (_) => Text(
              '${store.itensUsados}',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            )
          )
        ),
      )
    );
  }
}