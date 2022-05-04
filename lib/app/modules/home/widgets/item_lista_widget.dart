import 'package:flutter/material.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';

class ItemListaWidget extends StatelessWidget {

  final ListaModel listaModel;
  final Function treatDataUltimoUso;
  final Function navigateLista;

  const ItemListaWidget({ 
    Key? key, 
    required this.listaModel, 
    required this.treatDataUltimoUso,
    required this.navigateLista
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                listaModel.nmLista,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '${listaModel.itens.length} item(s)',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        treatDataUltimoUso(listaModel),
                      ),
                    ),
                  )
                ),
              ],
            )
          ],
        ),
      ),
      onTap: (){
        navigateLista(context, listaModel);
      },
    );
  }
}