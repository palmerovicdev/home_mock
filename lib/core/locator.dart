import 'package:get_it/get_it.dart';
import 'package:home_mock/core/theme.dart';
import 'package:home_mock/data/api/home_api.dart';
import 'package:home_mock/data/repository/home_repository.dart';
import 'package:home_mock/service/home_service.dart';
import 'package:screen_corner_radius/screen_corner_radius.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerSingleton<Theme>(Theme(true));
  await setUpRadius().then((value) {
    locator.registerSingleton<ScreenRadius>(value);
  });

  locator.registerLazySingleton<HomeApi>(() => HomeApiImpl());
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(locator<HomeApi>()),
  );

  locator.registerLazySingleton<HomeService>(
    () => HomeServiceImpl(locator<HomeRepository>()),
  );
}

Future<ScreenRadius> setUpRadius() async {
  return await ScreenCornerRadius.get() ?? ScreenRadius.value(24);
}

Theme get theme => locator.get<Theme>();

HomeApi get homeApi => locator.get<HomeApi>();

HomeRepository get homeRepository => locator.get<HomeRepository>();

HomeService get homeService => locator.get<HomeService>();
