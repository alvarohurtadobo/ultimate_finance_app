import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ultimate_finance_app/di/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies() async => await initGetIt(getIt);
