import 'package:ethio_duolingo/data/local/sqlite.dart';
import 'package:ethio_duolingo/data/network/api/login_api.dart';
import 'package:ethio_duolingo/data/network/api/posts_api.dart';
import 'package:ethio_duolingo/data/network/provider_api/provider_api.dart';
import 'package:ethio_duolingo/data/network/service/auth_service.dart';
import 'package:ethio_duolingo/data/network/service/posts_service.dart';
import 'package:ethio_duolingo/data/preferences/preferences.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ProviderApi());

  //Service
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => PostsService());

  //Api
  locator.registerFactory(() => LoginApi());
  locator.registerFactory(() => PostsApi());

  //Sqlite
  locator.registerLazySingleton(() => Sqlite());

  //Preferences
  locator.registerLazySingleton(() => Preferences());
}
