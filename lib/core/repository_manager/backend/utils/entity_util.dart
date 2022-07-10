import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/repository.dart';

class EntityUtil {
  static replaceObjectToId(Map<String, dynamic> data, String atributo) {
    if (data[atributo] != null) {
      data['${atributo}Id'] = data[atributo]['id'];
    }
    data.remove(atributo);
  }

  static replaceIdToObject(Map<String, dynamic> data, int? id, Repository repository) async {
    if (id != null) {
      return await repository.get(id);
    }
    return null;
  }

  static int replaceBoolToInt(Map<String, dynamic> data, String atributo) {
    return data[atributo] ? 1 : 0;
  }

  static bool replaceIntToBool(Map<String, dynamic> data, String atributo) {
    return data[atributo] > 0;
  }
}
