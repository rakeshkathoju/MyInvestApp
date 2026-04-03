import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'stocksdata/data/stock_list_repository_impl.dart';
import 'stocksdata/domain/stock_list_repository.dart';
import 'stocksdata/domain/stock_list_usecase.dart';
import 'stocksdata/presentation/stock_list_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // Register Dio as a singleton
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = "http://localhost:3000";
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    // Optional: Add interceptors for logging, headers, etc.
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  });

  // Register your service, injecting Dio
  getIt.registerLazySingleton<StockListRepository>(
    () => StockListRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<StockListUsecase>(
    () => StockListUsecase(getIt()),
  );
   getIt.registerLazySingleton<StockListBloc>(
    () => StockListBloc(getIt()),
  );
}

