import 'package:brainly/model/user_model.dart';
import 'package:brainly/routers/router.dart';
import 'package:brainly/screens/translate/model/translate_model.dart';
import 'package:brainly/theme/theme_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await _init();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/translations',
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TranslateModel()),
          ChangeNotifierProvider(create: (_) => UserModel()),
        ],
        child: const MyApp(),
      )));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
