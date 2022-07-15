import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/lista_usada_store.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/rotulo_itens_carrinho_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/rotulo_itens_restantes_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/valor_itens_carrinho_widget.dart';
import 'package:lista_mercado_mobile/app/modules/listas_usadas/widgets/valor_itens_restantes_widget.dart';
import 'package:lista_mercado_mobile/core/formatters/uppercase_text_formatter.dart';

class SumarioWidget extends StatefulWidget {
  const SumarioWidget({ Key? key }) : super(key: key);

  @override
  State<SumarioWidget> createState() => _SumarioWidgetState();
}

class _SumarioWidgetState extends ModularState<SumarioWidget, ListaUsadaStore> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height:200.0,
        width: MediaQuery.of(context).size.width-30,
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        ValorItensRestantes(),
                        RotuloItensRestantes()
                      ],
                    ),
                    Row(
                      children: const [
                        ValorItensCarrinho(),
                        RotuloItensCarrinho()
                      ],
                    ),
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: store.pesquisaController,
                decoration: InputDecoration(
                  labelText: 'Pesquise um produto',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          width: 0, 
                          style: BorderStyle.solid,
                      ),
                  ),
                ),
                inputFormatters: [
                  UpperCaseTextFormatter()
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}