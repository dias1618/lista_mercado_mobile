import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_usada_model.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/lista_usada_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/services/item_usado_service.dart';

class ListaUsadaService {
  final ListaUsadaDAO listaUsadaDAO = ListaUsadaDAO();
  final ItemUsadoService itemUsadoService = ItemUsadoService();

  insert(ListaUsadaModel listaUsadaModel) async {
    Map<String, dynamic> data = listaUsadaModel.toJson();
    data['lgFechada'] = data['lgFechada'] ? 1 : 0;
    int id = await listaUsadaDAO.insert(data);
    listaUsadaModel.id = id;
    for (ItemUsadoModel item in listaUsadaModel.itensUsados!) {
      item.listaUsadaId = id;
      await itemUsadoService.insert(item);
    }
    return listaUsadaModel.toJson();
  }

  update(ListaUsadaModel listaUsadaModel) async {
    Map<String, dynamic> data = listaUsadaModel.toJson();
    data['lgFechada'] = data['lgFechada'] ? 1 : 0;
    await listaUsadaDAO.update(data);
    return listaUsadaModel.toJson();
  }

  delete(int id) async {
    Map<dynamic, dynamic> data = (await listaUsadaDAO.get(id))!;
    await listaUsadaDAO.delete(id);
    List<Map<dynamic, dynamic>>? itens =
        await itemUsadoService.find({'A.listaUsadaId': id});
    for (Map<dynamic, dynamic> item in itens!) {
      await itemUsadoService.delete(item['id']);
    }
    return data;
  }

  get(int id) async {
    Map<dynamic, dynamic>? data = await listaUsadaDAO.get(id);
    return data!;
  }

  find(Map<String, dynamic>? query) async {
    List<Map<dynamic, dynamic>>? map = await listaUsadaDAO.find(query);
    for (Map<dynamic, dynamic> itemMap in map!) {
      itemMap['lgFechada'] = _convertToBool(itemMap['lgFechada']);
      itemMap['itensUsados'] =
          await itemUsadoService.find({'A.listaUsadaId': itemMap['id']});
    }
    return map;
  }

  bool _convertToBool(int value) {
    return value == 0 ? false : true;
  }
}
