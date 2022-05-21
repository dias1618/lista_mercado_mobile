import 'package:lista_mercado_mobile/core/repository_manager/backend/controllers/controller.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/endpoints.map.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class SqlRepositoryManager implements RepositoryManager{

  @override
  Future create(ParameterRepository parametros, [data]) async {
    Controller controller = EndpointsMap().get(parametros.data!['path']);
    return controller.post(data);
  }

  @override
  Future delete(ParameterRepository parametros) {
    Controller controller = EndpointsMap().get(parametros.data!['path']);
    return controller.delete(parametros.data!['primaryKey']);
  }

  @override
  Future execute(ParameterRepository parametros, [data]) {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  Future find(ParameterRepository parametros) {
    Controller controller = EndpointsMap().get(parametros.data!['path']);
    return controller.find(parametros.data!['query']);
  }

  @override
  Future read(ParameterRepository parametros) {
    Controller controller = EndpointsMap().get(parametros.data!['path']);
    return controller.get(parametros.data!['primaryKey']);
  }

  @override
  Future update(ParameterRepository parametros, data) {
    Controller controller = EndpointsMap().get(parametros.data!['path']);
    return controller.put(data);
  }

}