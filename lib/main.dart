import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_finance_app/app_router.dart';
import 'package:ultimate_finance_app/app_theme.dart';
import 'package:ultimate_finance_app/blocs/auth/auth_bloc.dart';
import 'package:ultimate_finance_app/blocs/income_expense/income_expense_bloc.dart';
import 'package:ultimate_finance_app/blocs/income_expense/income_expense_event.dart';
import 'package:ultimate_finance_app/repositories/auth_repository.dart';
import 'package:ultimate_finance_app/repositories/income_expense_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ],
      child: MultiBlocProvider(
        // create: (localContext) => AuthBloc(
        //   authRepository: RepositoryProvider.of<AuthRepository>(localContext),
        // ),
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
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
              routerConfig: AppRouter.rounter,
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        ),
      ),
    );
  }
}
