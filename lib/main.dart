import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimate_finance_app/common/router/app_router.dart';
import 'package:ultimate_finance_app/common/theme/app_theme.dart';
import 'package:ultimate_finance_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_bloc.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/presentation/bloc/income_expense_event.dart';
import 'package:ultimate_finance_app/feature/auth/data/services/auth_repository.dart';
import 'package:ultimate_finance_app/feature/income_deprecated/data/services/income_expense_repository.dart';
import 'package:ultimate_finance_app/common/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  final hiveService = HiveService();
  await hiveService.init();
  runApp(MyApp(hiveService: hiveService));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.hiveService, super.key});
  final HiveService hiveService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<IncomeExpenseRepository>(
          create: (context) => IncomeExpenseRepository(),
        ),
        RepositoryProvider.value(value: hiveService),
      ],
      child: MultiBlocProvider(
        // create: (localContext) => AuthBloc(
        //   authRepository: RepositoryProvider.of<AuthRepository>(localContext),
        // ),
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
              hiveService: RepositoryProvider.of<HiveService>(context),
            ),
          ),
          BlocProvider<IncomeExpenseBloc>(
            create: (context) => IncomeExpenseBloc(
              RepositoryProvider.of<IncomeExpenseRepository>(context),
            )..add(LoadTransactions()),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              title: 'Ultimate Finance App',
              darkTheme: AppThemes.greenFinanceDarkTheme,
              theme: AppThemes.greenFinanceTheme,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              routerConfig: AppRouter.router,
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        ),
      ),
    );
  }
}
