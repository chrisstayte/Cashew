import 'package:cashew/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsRoot extends StatelessWidget {
  const SettingsRoot({Key? key, required this.navigatorKey}) : super(key: key);
  final Key navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return const SettingsScreen();
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
          },
        );
      },
    );
  }
}
