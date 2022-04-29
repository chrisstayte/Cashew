import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/bill_sorting_method.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:cashew/screens/manage/widgets/bill_type_card_group.dart';
import 'package:cashew/screens/manage/widgets/bill_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({Key? key}) : super(key: key);

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  final double cardPadding = 10;

  final List<BillTypeCardGroup> _billCards = [
    BillTypeCardGroup(
      key: UniqueKey(),
      title: 'Utilities',
      billType: BillType.utility,
    ),
    BillTypeCardGroup(
      key: UniqueKey(),
      title: 'Subscriptions',
      billType: BillType.subscription,
    ),
    BillTypeCardGroup(
      key: UniqueKey(),
      title: 'Financed',
      billType: BillType.financed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bills'),
        actions: [
          Visibility(
              visible: kDebugMode,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: context.read<BillProvider>().deleteAllBills,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //context.read<BillProvider>().addDummyData();
          await Navigator.pushNamed(context, '/addBill');
        },
        child: Icon(
          Icons.add_rounded,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: context.watch<BillProvider>().bills.length == 0
            ? Center(
                child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      context.read<BillProvider>().addDummyData();
                    }
                  },
                  child: Text(
                    'No Bills Added',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              )
            : ListView(
                children: _billCards,
              ),
      ),
    );
  }
}
