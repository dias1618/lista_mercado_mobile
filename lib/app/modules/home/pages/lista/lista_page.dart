import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/core/widgets/app_bar_custom.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ListaPage extends StatefulWidget {
  final String title;
  final ListaModel? lista;

  const ListaPage({
    Key? key, 
    required this.title,
    this.lista
  }) : super(key: key);

  @override
  ListaPageState createState() => ListaPageState();
}
class ListaPageState extends ModularState<ListaPage, ListaStore> {
  
  @override
  Widget build(BuildContext context) {
    store.load(widget.lista);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarCustom(
          title: widget.title,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Descrição'),
              Tab(text: 'Itens'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReactiveForm(
            formGroup: store.form,
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0), 
                    child: ReactiveTextField(
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      formControlName: 'nmLista',
                      validationMessages: (control) => {
                        'required': 'O nome da lista não pode ser vazio'
                      },
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0), 
                    child: ReactiveTextField(
                      decoration: const InputDecoration(
                        labelText: 'Último uso',
                      ),
                      formControlName: 'dtUltimoUso',
                      readOnly: true, 
                      valueAccessor: DateTimeValueAccessor(
                        dateTimeFormat: DateFormat('dd/MM/yyyy') ,
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0), 
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                      ),
                      onPressed: (){
                        store.salvar(context);
                      }, 
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0), 
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                        primary: Theme.of(context).errorColor  
                      ),
                      onPressed: (){
                        store.remover(context);
                      }, 
                      child: const Text(
                        'Remover',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    )
                  )
                ],
              ),
            ),
            Container(
              child: const Text('Itens'),
            ),
          ],
        ),
      )
    );
  }
}