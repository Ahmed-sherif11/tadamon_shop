import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> init() async {
  //! Presentation Layer (Blocs)
  // sl.registerFactory(() => ProductBloc(repository: sl()));

  //! Domain Layer (Use Cases & Repositories)
  // sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: sl()));

  //! Data Layer (Data Sources)
  // هنا بنحدد المصدر (مثلاً ApiService)
  // sl.registerLazySingleton(() => http.Client());
}
