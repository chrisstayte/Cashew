import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/bill_type_card_sorting_method.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:cashew/screens/manage/widgets/bill_list_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        // Icon(
                        //   Icons.sort,
                        // ),
                        PopupMenuButton(
                          child: Icon(Icons.sort),
                          onSelected: (value) => context
                              .read<SettingsProvider>()
                              .setBillTypeCardSortingMethod(widget.billType,
                                  value as BillTypeCardSortingMethod),
                          itemBuilder: (context) {
                            return <PopupMenuItem<BillTypeCardSortingMethod>>[
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod.costAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown19),
                                  title: Text('Cost (Low - High)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .costAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod.costDescending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown91),
                                  title: Text('Cost (High - Low)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .costDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod.titleAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDownAZ),
                                  title: Text('Title Ascending'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .titleAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value:
                                    BillTypeCardSortingMethod.titleDescending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDownZA),
                                  title: Text('Title Descending'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .titleDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod
                                    .dateCreatedAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown19),
                                  title: Text('Date Created (New - Old)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .dateCreatedAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod
                                    .dateCreatedAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown91),
                                  title: Text('Date Created (Old - New)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .dateCreatedDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod
                                    .nextDueDateAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown19),
                                  title: Text('Next Due Date (Sooner - Later)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .nextDueDateAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod
                                    .nextDueDateDescending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown91),
                                  title: Text('Next Due Date (Later - Sooner)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod
                                              .nextDueDateDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillTypeCardSortingMethod>(
                                value: BillTypeCardSortingMethod.category,
                                child: ListTile(
                                  leading: Icon(Icons.category_rounded),
                                  title: Text('Category'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeCardSortingMethod(
                                                  widget.billType) ==
                                          BillTypeCardSortingMethod.category
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                            ];
                          },
                        )
                        // DropdownButtonHideUnderline(
                        //   child: DropdownButton(
                        //     isDense: true,
                        //     icon: Icon(Icons.sort),
                        //     value: context
                        //         .watch<SettingsProvider>()
                        //         .getBillTypeCardSortingMethod(widget.billType),
                        //     onChanged: (value) {
                        //       context
                        //           .read<SettingsProvider>()
                        //           .setBillTypeCardSortingMethod(widget.billType,
                        //               value as BillTypeCardSortingMethod);
                        //     },
                        //     items: const [
                        //       DropdownMenuItem<BillTypeCardSortingMethod>(
                        //         child: Text('Title Ascending'),
                        //         value: BillTypeCardSortingMethod.titleAscending,
                        //       ),
                        //       DropdownMenuItem<BillTypeCardSortingMethod>(
                        //         child: Text('Date Created Ascending'),
                        //         value: BillTypeCardSortingMethod
                        //             .dateCreatedAscending,
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                    Text('\$${GetTotalCost()}'),
                    Divider(),
                    Column(
                        children: (context
                                .watch<BillProvider>()
                                .bills
                                .where((element) =>
                                    element.type == widget.billType)
                                .toList()
                              ..sort(Global.billSorting.sortingBin[context
                                      .watch<SettingsProvider>()
                                      .getBillTypeCardSortingMethod(
                                          widget.billType)] ??
                                  (a, b) =>
                                      a.dateCreated.compareTo(b.dateCreated)))
                            .map<BillListItem>(
                              (bill) => BillListItem(
                                bill: bill,
                              ),
                            )
                            .toList()),
                  ],
                ),
              ),
            ),
          );
  }
}
