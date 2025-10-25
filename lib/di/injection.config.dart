// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ultimate_finance_app/common/remoteconfig/domain/repository/remote_config_bool_repository.dart'
    as _i599;
import 'package:ultimate_finance_app/common/repositories/remote_config_bool_repository_impl.dart'
    as _i82;
import 'package:ultimate_finance_app/common/services/remote_config_module.dart'
    as _i796;
import 'package:ultimate_finance_app/common/services/remote_config_service.dart'
    as _i144;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final remoteConfigModule = _$RemoteConfigModule();
  await gh.factoryAsync<_i627.FirebaseRemoteConfig>(
    () => remoteConfigModule.remoteConfig,
    preResolve: true,
  );
  gh.lazySingleton<_i144.RemoteConfigService>(
    () => _i144.RemoteConfigService(gh<_i627.FirebaseRemoteConfig>()),
  );
  gh.factory<_i599.RemoteConfigBoolRepository>(
    () => _i82.RemoteConfigBoolRepositoryImpl(gh<_i627.FirebaseRemoteConfig>()),
  );
  return getIt;
}

class _$RemoteConfigModule extends _i796.RemoteConfigModule {}
