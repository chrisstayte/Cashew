import 'package:cashew/screens/calculate/calculate_root.dart';
import 'package:cashew/screens/manage/manage_root.dart';
import 'package:cashew/screens/overview/overview_root.dart';
import 'package:cashew/screens/settings/settings_root.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  List<GlobalKey<NavigatorState>> keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    // GlobalKey<NavigatorState>()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ManageRoot(
            navigatorKey: keys[0],
          ),
          OverviewRoot(
            navigatorKey: keys[1],
          ),
          SettingsRoot(
            navigatorKey: keys[2],
          )
          // CalculateRoot(
          //   navigatorKey: keys[3],
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
            });
            return;
          }

          if (keys[index].currentState!.canPop()) {
            keys[index].currentState!.popUntil((route) => route.isFirst);
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Manage',
            icon: FaIcon(FontAwesomeIcons.barsProgress),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.donut_large),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: FaIcon(FontAwesomeIcons.gear),
          )
          // BottomNavigationBarItem(
          //   label: 'Calculate',
          //   icon: FaIcon(FontAwesomeIcons.calculator),
          // ),
        ],
      ),
    );
  }
}
