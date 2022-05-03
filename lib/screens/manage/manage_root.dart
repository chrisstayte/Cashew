import 'package:cashew/models/bill.dart';
import 'package:cashew/screens/manage/add_bill_screen.dart';
import 'package:cashew/screens/bill_screen.dart';
import 'package:cashew/screens/edit_bill_screen.dart';
import 'package:cashew/screens/manage/manage_screen.dart';
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
              case '/bill':
                Bill bill = settings.arguments as Bill;
                return BillScreen(bill: bill);
              case '/addBill':
                return AddBillScreen();
              case '/editBill':
                Bill existingBill = settings.arguments as Bill;
                return EditBillScreen(existingBill: existingBill);
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
          },
        );
      },
    );
  }
}
