import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService(this._remoteConfig);

  // Si en algún momento necesitas reinit o forzar un fetch:
  Future<bool> refresh() async {
    final fetched = await _remoteConfig.fetchAndActivate();
    return fetched;
  }

  String get welcomeMessage => _remoteConfig.getString('welcome_message');
  String get version => _remoteConfig.getString('version');
  bool get showPromo => _remoteConfig.getBool('show_promo');
}

// import 'package:firebase_remote_config/firebase_remote_config.dart';


// class RemoteConfigService {
//   final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

//   Future<void> initialize() async {
//     await _remoteConfig.setConfigSettings(
//       RemoteConfigSettings(
//         fetchTimeout: const Duration(seconds: 10),
//         minimumFetchInterval: const Duration(
//           hours: 1,
//         ), // evita fetchs muy frecuentes
//       ),
//     );

//     await _remoteConfig.setDefaults({
//       'welcome_message': 'Bienvenido por defecto',
//       'show_promo': false,
//     });

//     await _remoteConfig.fetchAndActivate();
//   }

//   String get welcomeMessage => _remoteConfig.getString('welcome_message');
//   String get version => _remoteConfig.getString('version');
//   bool get showPromo => _remoteConfig.getBool('show_promo');
// }
