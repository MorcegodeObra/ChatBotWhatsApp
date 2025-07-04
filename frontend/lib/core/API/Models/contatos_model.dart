import 'package:dio/dio.dart';
import '../tratamento_erros_api.dart';

class ContatosModel {
  final Dio dio;

  ContatosModel(this.dio);

  Future<List<Map<String, dynamic>>> getContatos() async {
    try {
      final response = await dio.get('/contatos');
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw CustomException(handleDioError(e));
    }
  }

  Future<List<Map<String, dynamic>>> getContato(int id) async {
    try {
      final response = await dio.get('/contatos/$id');
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw CustomException(handleDioError(e));
    }
  }

  Future criarContatos(Map<String, dynamic> data) async {
    try {
      final response = await dio.post('/contatos', data: data);
      return response.data;
    } on DioException catch (e) {
      throw CustomException(handleDioError(e));
    }
  }

Future<void> adicionarEmail(int id, List<Map<String, dynamic>> emails) async {
  try {
    await dio.post('/contatos/$id/emails', data: {
      'emails': emails,
    });
  } on DioException catch (e) {
    throw CustomException(handleDioError(e));
  }
}


  Future<void> atualizarContatos(int id, Map<String, dynamic> data) async {
    try {
      await dio.put('/contatos/$id', data: data);
    } on DioException catch (e) {
      throw CustomException(handleDioError(e));
    }
  }

  Future<void> deletarcontatos(int id) async {
    try {
      await dio.delete('/contatos/$id');
    } on DioException catch (e) {
      throw CustomException(handleDioError(e));
    }
  }
}
