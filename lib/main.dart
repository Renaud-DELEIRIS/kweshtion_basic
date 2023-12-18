import 'package:flutter/material.dart';
import 'package:kweshtion_basic/config/app_router.dart';
import 'package:kweshtion_basic/config/injections/injection.dart';
import 'package:kweshtion_basic/theme/dark_theme.dart';
import 'package:kweshtion_basic/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
