import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService(this._remoteConfig);

  Future<bool> refresh() async {
    final fetched = await _remoteConfig.fetchAndActivate();
    return fetched;
  }

  bool get isMaintenance => _remoteConfig.getBool('maintenance');
  String get appVersion => _remoteConfig.getString('version');
}
