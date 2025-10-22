// lib/di/injection_manual.dart
import 'package:get_it/get_it.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:ultimate_finance_app/common/repositories/remote_config_bool_repository_impl.dart';
import 'package:ultimate_finance_app/common/services/remote_config_service.dart';
// import 'package:ultimate_finance_app/di/injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependenciesManual() async {
  // 1) Configurar Remote Config y hacer fetch+activate (equivalente a @preResolve)
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

  // 2) Registrar en GetIt
  // Registramos la instancia de FirebaseRemoteConfig
  getIt.registerSingleton<FirebaseRemoteConfig>(remoteConfig);

  // Registrar el servicio como lazySingleton (se crea a la primera petición)
  getIt.registerLazySingleton<RemoteConfigService>(
    () => RemoteConfigService(remoteConfig),
  );

  // Registrar la implementación del repositorio
  getIt.registerLazySingleton<RemoteConfigBoolRepositoryImpl>(
    () => RemoteConfigBoolRepositoryImpl(remoteConfig),
  );

  // Si tienes la interfaz, registra la implementación bajo la interfaz:
  // getIt.registerLazySingleton<RemoteConfigBoolRepository>(
  //   () => RemoteConfigBoolRepositoryImpl(remoteConfig),
  // );
}