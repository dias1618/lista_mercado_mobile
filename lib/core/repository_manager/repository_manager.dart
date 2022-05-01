import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';

abstract class RepositoryManager{
  Future<T> execute<T>(ParameterRepository parametros, [dynamic data]);
  Future<T> create<T>(ParameterRepository parametros, [dynamic data]);
  Future<T> read<T>(ParameterRepository parametros);
  Future<List<dynamic>> find<T>(ParameterRepository parametros);
  Future<T> update<T>(ParameterRepository parametros, dynamic data);
  Future<T> delete<T>(ParameterRepository parametros);
}