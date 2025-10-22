import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RemoteConfigModule {
  @preResolve
  Future<FirebaseRemoteConfig> get remoteConfig async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    // defaults por si no hay valores remotos
    await remoteConfig.setDefaults(<String, dynamic>{
      'welcome_message': 'Bienvenido por defecto',
      'show_promo': false,
    });

    // fetch y activate aquí (async)
    await remoteConfig.fetchAndActivate();

    return remoteConfig;
  }
}