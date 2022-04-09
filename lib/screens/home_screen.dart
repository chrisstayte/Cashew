import 'package:cashew/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverviewScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            label: 'Settings',
            icon: FaIcon(FontAwesomeIcons.calculator),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: FaIcon(FontAwesomeIcons.magnifyingGlassChart),
          ),
          BottomNavigationBarItem(
            label: 'Manage',
            icon: FaIcon(FontAwesomeIcons.barsProgress),
          ),
        ],
      ),
    );
  }
}
