import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(
          hours: 1,
        ), // evita fetchs muy frecuentes
      ),
    );

    await _remoteConfig.setDefaults({
      'welcome_message': 'Bienvenido por defecto',
      'show_promo': false,
    });

    await _remoteConfig.fetchAndActivate();
  }

  String get welcomeMessage => _remoteConfig.getString('welcome_message');
  bool get showPromo => _remoteConfig.getBool('show_promo');
}
