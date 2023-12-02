import 'package:dio/dio.dart';

import '../../../../core/const/errors_const.dart';
import '../../../../core/services/dot_env_service.dart';
import '../../../models/api_response_model.dart';
import '../i_api_repository.dart';

class DioRepositoryImpl implements IApiRepository {
  final Dio dio;

  DioRepositoryImpl({required this.dio});

  @override
  Future<(String?, ApiResponseModel<T>?)> get<T>(String url) async {
    try {
      final response = await dio.get(
        url,
        options: Options(headers: {
          "Authorization": "Bearer : ${DotEnvService.getApiToken}"
        }),
      );
      return (
        null,
        ApiResponseModel<T>(
            data: response.data as T, statusMessage: response.statusMessage)
      );
    } on DioException catch (dioException) {
      final errorMessage =
          dioException.message ?? ErrorsConst.API_DEFAULT_ERROR;
      return (errorMessage, null);
    }
  }
}
