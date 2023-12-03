import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/api_repository/dio/dio_repository.dart';
import '../../data/repositories/api_repository/i_api_repository.dart';
import '../services/dot_env_service.dart';

final makeApiRepository = Provider<IApiRepository>(
  create: (_) => DioRepositoryImpl(
    dio: Dio(
      BaseOptions(
        baseUrl: DotEnvService.getApiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ),
  ),
);
