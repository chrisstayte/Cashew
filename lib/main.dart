import 'package:cashew/global/global.dart';
import 'package:cashew/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Global.colors.lightIconColor,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          color: Global.colors.lightIconColor,
          titleTextStyle: GoogleFonts.barlow(
            textStyle: Theme.of(context).textTheme.headline5,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Global.colors.lightIconColorDarker,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Global.colors.lightIconColor,
          selectedItemColor: Global.colors.darkIconColor,
          unselectedItemColor: Global.colors.lightIconColorDarker,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        textTheme: GoogleFonts.barlowTextTheme(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Global.colors.darkIconColor),
        iconTheme: IconThemeData(
          color: Global.colors.darkIconColor,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Global.colors.lightIconColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
