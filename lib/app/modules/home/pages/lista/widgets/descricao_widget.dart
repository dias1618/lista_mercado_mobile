import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/lista_store.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_button.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_date_field.dart';
import 'package:lista_mercado_mobile/core/widgets/custom_reactive_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Descricao extends StatefulWidget {

  final ListaModel? lista;

  const Descricao({ 
    Key? key,
    this.lista,
  }) : super(key: key);

  @override
  State<Descricao> createState() => _DescricaoState();
}

class _DescricaoState extends ModularState<Descricao, ListaStore> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: store.load(widget.lista),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Scaffold(
          body: ReactiveForm(
            formGroup: store.form,
            child: Column(
              children: <Widget>[
                const CustomReactiveTextField(
                  label: 'Nome', 
                  formControlName: 'nmLista', 
                  validationMessages: {
                    'required': 'O nome da lista não pode ser vazio'
                  }
                ),
                CustomButton(
                  label: 'Salvar', 
                  onPressed: store.salvar, 
                  color: Theme.of(context).primaryColor,
                ),
                Visibility(
                  visible: widget.lista != null,
                  child: CustomButton(
                    label: 'Remover', 
                    onPressed: store.remover, 
                    color: Theme.of(context).errorColor,
                  )
                ),
              ],
            ),
          ),
          floatingActionButton: Observer(
            builder: (_) => Visibility(
              visible: widget.lista != null,
              child: Stack(
                children: [        
                  FloatingActionButton(
                    onPressed: () {
                      store.usarLista(context);
                    },
                    child: const Icon(Icons.shopping_cart),
                  ),
                  Positioned(
                    top: 28.0,
                    left: 30.0,
                    child: Visibility(
                      visible: store.quantItensUsados >= 0,
                      child: GestureDetector(
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                              bottomLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            )
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              store.quantItensUsados.toString(),
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ),
                        onTap: (){
                          store.usarLista(context);
                        },
                      )
                    )
                  )
                ]
              ),
            )
          )
        );
      }
    );
  }
}