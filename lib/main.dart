import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:cashew/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  Hive.registerAdapter<Bill>(BillAdapter());
  Hive.registerAdapter<BillCategory>(BillCategoryAdapter());
  Hive.registerAdapter<BillType>(BillTypeAdapter());
  Hive.registerAdapter<Occurrence>(OccurrenceAdapter());

  await Hive.initFlutter();
  await Hive.openBox<Bill>(BillProvider.BoxName);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(), lazy: false),
      ChangeNotifierProvider<BillProvider>(create: (_) => BillProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: 'Cashew',
      themeMode: context.watch<SettingsProvider>().isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.white60,
          appBarTheme: AppBarTheme(
            centerTitle: false,
            color: Colors.white,
            titleTextStyle: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                ),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          dividerColor: Colors.black,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
          // textTheme: GoogleFonts.mPlusRounded1cTextTheme(),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.black,
          ),
          popupMenuTheme: PopupMenuThemeData(
            color: Colors.white,
          ),
          chipTheme: ChipThemeData(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            selectedColor: Colors.black,
            labelStyle: TextStyle(color: Colors.black),
            secondaryLabelStyle: TextStyle(color: Colors.white),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
          ),
          dividerTheme: DividerThemeData(color: Colors.black)),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Global.colors.darkIconColor,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          color: Global.colors.darkIconColor,
          // titleTextStyle: GoogleFonts.barlow(
          //   textStyle: Theme.of(context).textTheme.headline5,
          //   fontSize: 28,
          //   fontWeight: FontWeight.w500,
          // ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Global.colors.lightIconColorDarker,
          ),
        ),
        dividerColor: Global.colors.lightIconColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Global.colors.darkIconColor,
          selectedItemColor: Global.colors.lightIconColor,
          unselectedItemColor: Global.colors.darkIconColorLighter,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        // textTheme: GoogleFonts.mPlusRounded1cTextTheme(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Global.colors.lightIconColor,
        ),
        iconTheme: IconThemeData(
          color: Global.colors.lightIconColor,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Global.colors.darkIconColorLighter,
          selectedColor: Global.colors.lightIconColorDarker,
          labelStyle: const TextStyle(color: Colors.black),
          secondaryLabelStyle: const TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
