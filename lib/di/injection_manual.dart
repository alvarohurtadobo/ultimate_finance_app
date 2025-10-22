import 'package:get_it/get_it.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:ultimate_finance_app/common/repositories/remote_config_bool_repository_impl.dart';
import 'package:ultimate_finance_app/common/services/remote_config_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependenciesManual() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.setDefaults(<String, dynamic>{
    'welcome_message': 'Bienvenido por defecto',
    'show_promo': false,
  });

  await remoteConfig.fetchAndActivate();

  getIt.registerSingleton<FirebaseRemoteConfig>(remoteConfig);

  getIt.registerLazySingleton<RemoteConfigService>(
    () => RemoteConfigService(remoteConfig),
  );

  getIt.registerLazySingleton<RemoteConfigBoolRepositoryImpl>(
    () => RemoteConfigBoolRepositoryImpl(remoteConfig),
  );

  // In case of GUI
  // getIt.registerLazySingleton<RemoteConfigBoolRepository>(
  //   () => RemoteConfigBoolRepositoryImpl(remoteConfig),
  // );
}