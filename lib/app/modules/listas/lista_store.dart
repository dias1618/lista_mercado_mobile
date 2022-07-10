import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/builders/lista/lista_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/app/repositories/lista_repository.dart';
import 'package:lista_mercado_mobile/app/services/lista_usada_service.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:lista_mercado_mobile/core/modals/confirm_modal.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'lista_store.g.dart';

class ListaStore = _ListaStoreBase with _$ListaStore;

abstract class _ListaStoreBase with Store {
  final ListaRepository listaRepository = Modular.get<ListaRepository>();
  final ListaUsadaService listaUsadaService = Modular.get<ListaUsadaService>();

  @observable
  ListaModel? listaModel;

  @observable
  int quantItensUsados = -1;

  final form = FormGroup({
    'id': FormControl<int>(),
    'nmLista': FormControl<String>(),
    'itens': FormControl<List<dynamic>>(),
  });

  @action
  load(ListaModel? listaModel) async {
    this.listaModel = listaModel;
    if (this.listaModel != null) {
      form.patchValue({
        'id': this.listaModel!.id,
        'nmLista': this.listaModel!.nmLista,
      });
      await getQuantItensUsados();
    }
  }

  @action
  salvar(BuildContext context) async {
    try {
      listaModel = ListaBuilder().fromJson(form.value).build();
      if (listaModel!.id! > 0) {
        await listaRepository.update(listaModel!);
      } else {
        await listaRepository.create(listaModel!);
      }
      EasyLoading.showSuccess('Lista salva com sucesso!');
      Navigator.pop(context, listaModel);
    } on CustomException catch (error) {
      EasyLoading.showError(error.message);
    }
  }

  @action
  remover(BuildContext context) async {
    ConfirmModal('Deseja realmente remover essa lista?', _actionRemove)
        .show(context);
  }

  _actionRemove(BuildContext context) async {
    try {
      listaModel = ListaBuilder().fromJson(form.value).build();
      await listaRepository.remove(listaModel!.id!);
      EasyLoading.showSuccess('Lista removida com sucesso!');
      Navigator.pop(context, listaModel);
    } on CustomException catch (error) {
      EasyLoading.showError(error.message);
    }
  }

  @action
  usarLista(BuildContext context) async {
    Navigator.of(context).pushNamed('/listasusadas', arguments: {'lista': listaModel}).then((value) {
      getQuantItensUsados();
    });
  }

  @action
  Future<void> getQuantItensUsados() async {
    quantItensUsados = -1;
    ListaUsadaModel? listaUsadaModel = await listaUsadaService.getListaUsada(listaModel!);
    if (listaUsadaModel != null) {
      quantItensUsados = 0;
      for (ItemUsadoModel item in listaUsadaModel.itensUsados!) {
        if (item.lgMarcado!) {
          quantItensUsados++;
        }
      }
    }
  }
}
