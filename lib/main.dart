import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
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
      ChangeNotifierProvider<BillProvider>(create: (_) => BillProvider())
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
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
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
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(),
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
