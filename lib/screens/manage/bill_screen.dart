import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/screens/manage/widgets/bill_info_card.dart';
import 'package:cashew/utilities/double_extensions.dart';
import 'package:cashew/utilities/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  @override
  // TODO: Add edit bill screen
  Widget build(BuildContext context) {
    DateTime? nextDueDate = bill.getNextPaymentDate();
    return Scaffold(
      appBar: AppBar(
        title: Text(bill.title),
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Verify Users Choice
              context.read<BillProvider>().deleteBill(bill);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  BillInfoCard(
                    title: 'Cost',
                    content: '\$${bill.cost.currency}',
                    iconData: Icons.textsms_sharp,
                  ),
                  BillInfoCard(
                    title: 'Next Due Date',
                    content: nextDueDate != null
                        ? '${nextDueDate.month}/${nextDueDate.day}/${nextDueDate.year}'
                        : 'Not Due',
                    iconData: Icons.textsms_sharp,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  BillInfoCard(
                    title: 'Type',
                    content: bill.type.name.capitalize,
                    iconData: Icons.textsms_sharp,
                  ),
                  BillInfoCard(
                    title: 'Category',
                    content: bill.category.name.capitalize,
                    iconData: Icons.textsms_sharp,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  BillInfoCard(
                    title: 'Repeating',
                    content: bill.repeat ? bill.occurrence!.nameReadable : 'No',
                    iconData: Icons.textsms_sharp,
                  ),
                  BillInfoCard(
                    title: 'Date Created',
                    content:
                        '${bill.dateCreated.month}/${bill.dateCreated.day}/${bill.dateCreated.year}',
                    iconData: Icons.calendar_today,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
