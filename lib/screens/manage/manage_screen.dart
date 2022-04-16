import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/screens/manage/widgets/bill_type_card.dart';
import 'package:cashew/screens/manage/widgets/payment_list_item.dart';
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

  final List<BillTypeCard> _billCards = [
    BillTypeCard(
      key: UniqueKey(),
      title: 'Utilities',
      billType: BillType.utility,
    ),
    BillTypeCard(
      key: UniqueKey(),
      title: 'Subscriptions',
      billType: BillType.subscription,
    ),
    BillTypeCard(
      key: UniqueKey(),
      title: 'Financed',
      billType: BillType.financed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(
          Icons.add_rounded,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: _billCards,
        ),
      ),
    );
  }
}
