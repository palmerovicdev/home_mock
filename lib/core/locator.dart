import 'package:get_it/get_it.dart';
import 'package:home_mock/core/theme.dart';
import 'package:home_mock/data/api/home_api.dart';
import 'package:home_mock/data/repository/home_repository.dart';
import 'package:home_mock/service/home_service.dart';


final locator = GetIt.instance;

Future<void> setUpLocator() async {
  final theme = Theme(true);
  await theme.load();
  locator.registerSingleton<Theme>(theme);

  locator.registerLazySingleton<HomeApi>(() => HomeApiImpl());
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(locator<HomeApi>()),
  );

  locator.registerLazySingleton<HomeService>(
    () => HomeServiceImpl(locator<HomeRepository>()),
  );
}

Theme get theme => locator.get<Theme>();
HomeApi get homeApi => locator.get<HomeApi>();
HomeRepository get homeRepository => locator.get<HomeRepository>();
HomeService get homeService => locator.get<HomeService>();
