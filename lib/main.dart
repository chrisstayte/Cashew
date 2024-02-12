import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
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
      debugShowCheckedModeBanner: true,
      showSemanticsDebugger: false,
      title: 'Cashew',
      themeMode: context.watch<SettingsProvider>().isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData.light().copyWith(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff645DE0)),
        textTheme: GoogleFonts.overpassTextTheme(),
        // scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          toolbarTextStyle:
              GoogleFonts.overpass().copyWith(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black,
              ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        // dividerColor: Colors.black,
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   selectedItemColor: Colors.black,
        //   unselectedItemColor: Colors.black54,
        //   showUnselectedLabels: false,
        //   showSelectedLabels: false,
        // ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //     backgroundColor: Colors.black, foregroundColor: Colors.white),
        // iconTheme: const IconThemeData(
        //   color: Colors.black,
        // ),
        // listTileTheme: const ListTileThemeData(
        //   iconColor: Colors.black,
        // ),
        // datePickerTheme: DatePickerThemeData(dividerColor: Colors.red),
        // popupMenuTheme: const PopupMenuThemeData(
        //   color: Colors.white,
        // ),
        // chipTheme: ChipThemeData(
        //   shape: RoundedRectangleBorder(
        //     side: const BorderSide(color: Colors.black, width: 1),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   backgroundColor: Colors.white,
        //   selectedColor: Colors.white,
        //   labelStyle: TextStyle(color: Colors.black),
        //   secondaryLabelStyle: TextStyle(color: Colors.black),
        // ),
        // textButtonTheme: TextButtonThemeData(
        //   style: TextButton.styleFrom(
        //     foregroundColor: Colors.black,
        //   ),
        // ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff645DE0)),
        textTheme: GoogleFonts.overpassTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          color: Colors.black,
          toolbarTextStyle:
              GoogleFonts.overpass().copyWith(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.white,
              ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        dividerColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          color: Colors.black,
        ),
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.black,
          selectedColor: Colors.black,
          labelStyle: TextStyle(color: Colors.white),
          secondaryLabelStyle: TextStyle(color: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
