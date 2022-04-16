import 'package:cashew/screens/manage/manage_screen.dart';
import 'package:cashew/screens/manage/section_screen.dart';
import 'package:flutter/material.dart';

class ManageRoot extends StatelessWidget {
  const ManageRoot({Key? key, required this.navigatorKey}) : super(key: key);
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
                return const ManageScreen();
              case '/section':
                String title = settings.arguments as String;
                return SectionScreen(title: title);
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
          },
        );
      },
    );
  }
}
