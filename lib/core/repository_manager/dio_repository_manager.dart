import 'package:dio/dio.dart';
import 'package:lista_mercado_mobile/core/exceptions/custom_exception.dart';
import 'package:lista_mercado_mobile/core/repository_manager/parameter_repository.dart';
import 'package:lista_mercado_mobile/core/repository_manager/repository_manager.dart';

class DioRepositoryManager implements RepositoryManager{
  
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://localhost:3000",
    connectTimeout: 5000,
  ));

  @override
  Future execute(ParameterRepository parametros, [dynamic data]) async {
    return await create(parametros, data);
  }

  @override
  Future create(ParameterRepository parametros, [dynamic data]) async {
    try{
      Response response = await dio.post(parametros.data!['path'], data: data);
      return response.data;
    } on DioError catch(dioException){
      if(dioException.type == DioErrorType.other) {
        throw CustomException(message: 'Erro de conexão');
      } else if(dioException.type == DioErrorType.connectTimeout) {
        throw CustomException(message: 'Tempo de conexão expirou');
      } else if(dioException.type == DioErrorType.response){
        if(dioException.response != null) {
          throw CustomException(message: dioException.response!.data['message']);  
        }
      }
      throw CustomException(message: 'Erro de conexão');
    }
  }

  @override
  Future delete(ParameterRepository parametros, [dynamic data]) async {
    try{
      Response response = await dio.delete(parametros.data!['path'], data: data);
      return response.data;
    } on DioError catch(dioException){
      if(dioException.type == DioErrorType.other) {
        throw CustomException(message: 'Erro de conexão');
      } else if(dioException.type == DioErrorType.connectTimeout) {
        throw CustomException(message: 'Tempo de conexão expirou');
      } else if(dioException.type == DioErrorType.response){
        if(dioException.response != null) {
          throw CustomException(message: dioException.response!.data['message']);  
        }
      }
      throw CustomException(message: 'Erro de conexão');
    }
  }


  @override
  Future find(ParameterRepository parametros) async {
    try{
      Response response = await dio.get(parametros.data!['path']);
      if(response.data.runtimeType == String) {
        return Future.value([]);
      }
      return response.data;
    } on DioError catch(dioException){
      if(dioException.type == DioErrorType.other) {
        throw CustomException(message: 'Erro de conexão');
      } else if(dioException.type == DioErrorType.connectTimeout) {
        throw CustomException(message: 'Tempo de conexão expirou');
      } else if(dioException.type == DioErrorType.response){
        if(dioException.response != null) {
          throw CustomException(message: dioException.response!.data['message']);  
        }
      }
      throw CustomException(message: 'Erro de conexão');
    }
  }

  @override
  Future read(ParameterRepository parametros) async {
    try{
      Response response = await dio.get(parametros.data!['path']);
      return response.data;
    } on DioError catch(dioException){
      if(dioException.type == DioErrorType.other) {
        throw CustomException(message: 'Erro de conexão');
      } else if(dioException.type == DioErrorType.connectTimeout) {
        throw CustomException(message: 'Tempo de conexão expirou');
      } else if(dioException.type == DioErrorType.response){
        if(dioException.response != null) {
          throw CustomException(message: dioException.response!.data['message']);  
        }
      }
      throw CustomException(message: 'Erro de conexão');
    }
  }

  @override
  Future update(ParameterRepository parametros, data) async {
    try{
      Response response = await dio.put(parametros.data!['path'], data: data);
      return response.data;
    } on DioError catch(dioException){
      if(dioException.type == DioErrorType.other) {
        throw CustomException(message: 'Erro de conexão');
      } else if(dioException.type == DioErrorType.connectTimeout) {
        throw CustomException(message: 'Tempo de conexão expirou');
      } else if(dioException.type == DioErrorType.response){
        if(dioException.response != null) {
          throw CustomException(message: dioException.response!.data['message']);  
        }
      }
      throw CustomException(message: 'Erro de conexão');
    }
  }    
}