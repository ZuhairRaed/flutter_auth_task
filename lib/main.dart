import 'package:flutter/material.dart';
import 'package:flutter_auth_task/core/providers/user_provider.dart';
import 'package:flutter_auth_task/screens/home_screen.dart';
import 'package:flutter_auth_task/screens/login_screen.dart';
import 'package:flutter_auth_task/core/managers/user_manager.dart';
import 'package:flutter_auth_task/screens/verify_email_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as p;

import 'core/application.dart';
import 'core/lang/app_localizations.dart';
import 'style/style.dart';

Future<void> initApp() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  await UserManager().initState();
  await UserManager().getAppLanguage();
  await UserManager().getAppTheme();
}

void main() async {
  await initApp();
  runApp(
    p.MultiProvider(providers: [
      p.ChangeNotifierProvider(create: (_) => UserProvider()),
    ], child: const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /*
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final local = ref.watch(langProvider);
        final theme = ref.watch(themeProvider);
        return MaterialApp(
          locale: local,
          theme: Style.lightTheme(context),
          themeMode: theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales(),
          home: const LoginScreen(),
        );
      },
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return p.Consumer<UserProvider>(
      builder: (context, usr, child) => 
      MaterialApp(
        locale: usr.appLang,
        theme: Style.lightTheme(context),
        themeMode: usr.appTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales(),
        routes: routes,
        home: const LoginScreen(),
      ),
    );
  }
}

Map<String, WidgetBuilder> routes = {

  LoginScreen.id:(context) => const LoginScreen(),
  VerfyEmailScreen.id:(context) => const VerfyEmailScreen(email: ''),
  HomeScreen.id:(context) => const HomeScreen(),
};