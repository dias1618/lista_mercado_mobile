import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';

abstract class RepositoryManager{
  Future execute(ParameterRepository parametros, [dynamic data]);
  Future create(ParameterRepository parametros, [dynamic data]);
  Future read(ParameterRepository parametros);
  Future find(ParameterRepository parametros);
  Future update(ParameterRepository parametros, dynamic data);
  Future delete(ParameterRepository parametros);
}