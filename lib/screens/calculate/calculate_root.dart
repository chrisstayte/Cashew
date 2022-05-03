import 'package:cashew/screens/calculate/calculate_screen.dart';
import 'package:flutter/material.dart';

class CalculateRoot extends StatelessWidget {
  const CalculateRoot({Key? key, required this.navigatorKey}) : super(key: key);
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
                return const CalculateScreen();
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
          },
        );
      },
    );
  }
}
