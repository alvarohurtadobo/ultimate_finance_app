import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'package:main/shared/remoteconfig/domain/repository/remote_config_bool_repository.dart';

@Injectable(as: RemoteConfigBoolRepository)
class RemoteConfigBoolRepositoryImpl implements RemoteConfigBoolRepository {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigBoolRepositoryImpl(this._remoteConfig);

  @override
  Future<bool> getRemoteConfigBool(String key) async {
    return _remoteConfig.getBool(key);
  }
}