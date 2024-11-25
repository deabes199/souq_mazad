import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:souq_mazad/core/network/api_services.dart';
import 'package:souq_mazad/features/home/data/repos/product_repo.dart';
import 'package:souq_mazad/features/home/logic/cubit/products_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGitIt() async {
  Dio dio = Dio();

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
}
