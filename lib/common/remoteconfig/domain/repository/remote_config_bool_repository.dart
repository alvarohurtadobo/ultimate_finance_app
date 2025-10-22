abstract class RemoteConfigBoolRepository {
  /// Obtiene el valor booleano de una clave en Remote Config.
  Future<bool> getRemoteConfigBool(String key);
}