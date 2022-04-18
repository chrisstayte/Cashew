import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/bill_type_card_sorting_method.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:cashew/screens/manage/widgets/bill_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillTypeCard extends StatefulWidget {
  const BillTypeCard({
    Key? key,
    required this.title,
    required this.billType,
  }) : super(key: key);

  final String title;
  final BillType billType;

  @override
  State<BillTypeCard> createState() => _BillTypeCardState();
}

class _BillTypeCardState extends State<BillTypeCard> {
  double GetTotalCost() {
    double totalCost = context
        .read<BillProvider>()
        .bills
        .where((bill) => bill.type == widget.billType)
        .fold<double>(
            0, (previousValue, element) => previousValue + element.cost);
    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return context
                .watch<BillProvider>()
                .bills
                .where((bill) => bill.type == widget.billType)
                .length ==
            0
        ? SizedBox()
        : GestureDetector(
            // onTap: () => Navigator.pushNamed(
            //   context,
            //   '/section',
            //   arguments: widget.title,
            // ),
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.sort,
                        ),
                      ],
                    ),
                    Text('\$${GetTotalCost()}'),
                    Divider(),
                    Column(
                      children: context
                          .watch<BillProvider>()
                          .bills
                          .where((element) => element.type == widget.billType)
                          .toList()
                          .map<BillListItem>(
                            (bill) => BillListItem(
                              bill: bill,
                            ),
                          )
                          .toList()
                        ..sort(
                          context
                                      .watch<SettingsProvider>()
                                      .getBillTypeCardSortingMethod(
                                          widget.billType) ==
                                  BillTypeCardSortingMethod.alphaAscending
                              ? (a, b) => a.bill.title.compareTo(b.bill.title)
                              : (b, a) => a.bill.title.compareTo(b.bill.title),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}