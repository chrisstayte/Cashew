import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/screens/widgets/bill_info_card.dart';
import 'package:cashew/utilities/double_extensions.dart';
import 'package:cashew/utilities/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  // TODO: Add edit bill screen
  Widget build(BuildContext context) {
    DateTime? nextDueDate = widget.bill.getNextPaymentDate();
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          widget.bill.title,
          maxLines: 1,
          minFontSize: 12,
        ),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 1,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.delete),
                  title: Text('Delete'),
                ),
              )
            ],
            onSelected: (value) async {
              switch (value) {
                case 1:
                  await Navigator.pushNamed(context, '/editBill',
                          arguments: widget.bill)
                      .then((value) => setState(() => {}));
                  break;
                case 2:
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: Text(
                          'Delete ${widget.bill.title}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context
                                  .read<BillProvider>()
                                  .deleteBill(widget.bill);
                              Navigator.of(dialogContext).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                  break;
              }
            },
          ),
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
                    content: '\$${widget.bill.cost.currency}',
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
                    title: 'This Months Cost',
                    content: '\$${widget.bill.getMonthlyCost().currency}',
                    iconData: Icons.textsms_sharp,
                  ),
                  BillInfoCard(
                    title: 'Date Started',
                    content:
                        '${widget.bill.startDate.month}/${widget.bill.startDate.day}/${widget.bill.startDate.year}',
                    iconData: Icons.calendar_today,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  BillInfoCard(
                    title: 'Type',
                    content: widget.bill.type.name.capitalize,
                    iconData: Icons.textsms_sharp,
                  ),
                  BillInfoCard(
                    title: 'Category',
                    content: widget.bill.category.name.capitalize,
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
                    content: widget.bill.repeat
                        ? widget.bill.occurrence!.nameReadable
                        : 'No',
                    iconData: Icons.textsms_sharp,
                  ),
                  BillInfoCard(
                    title: 'Date Created',
                    content:
                        '${widget.bill.dateCreated.month}/${widget.bill.dateCreated.day}/${widget.bill.dateCreated.year}',
                    iconData: Icons.calendar_today,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
