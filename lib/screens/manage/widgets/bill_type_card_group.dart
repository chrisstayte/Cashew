import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/bill_sorting_method.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:cashew/screens/manage/widgets/bill_list_item.dart';
import 'package:cashew/utilities/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BillTypeCardGroup extends StatefulWidget {
  const BillTypeCardGroup({
    Key? key,
    required this.title,
    required this.billType,
  }) : super(key: key);

  final String title;
  final BillType billType;

  @override
  State<BillTypeCardGroup> createState() => _BillTypeCardGroupState();
}

class _BillTypeCardGroupState extends State<BillTypeCardGroup> {
  double _getTotalCost() {
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
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  width: .8,
                  color: context.watch<SettingsProvider>().isDarkMode
                      ? Colors.white
                      : Colors.black,
                ),
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
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Spacer(),
                        // Icon(
                        //   Icons.sort,
                        // ),
                        PopupMenuButton(
                          child: Icon(Icons.sort),
                          onSelected: (value) => context
                              .read<SettingsProvider>()
                              .setBillTypeCardSortingMethod(
                                  widget.billType, value as BillSortingMethod),
                          itemBuilder: (context) {
                            return <PopupMenuItem<BillSortingMethod>>[
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.costAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown19),
                                  title: Text('Cost (Low - High)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod.costAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.costDescending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown91),
                                  title: Text('Cost (High - Low)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod.costDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.titleAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDownAZ),
                                  title: Text('Title Ascending'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod.titleAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.titleDescending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDownZA),
                                  title: Text('Title Descending'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod.titleDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.dateCreatedAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown19),
                                  title: Text('Date Created (New - Old)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod.dateCreatedAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.dateCreatedAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown91),
                                  title: Text('Date Created (Old - New)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod
                                              .dateCreatedDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.nextDueDateAscending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown19),
                                  title: Text('Next Due Date (Sooner - Later)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod.nextDueDateAscending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.nextDueDateDescending,
                                child: ListTile(
                                  leading: FaIcon(FontAwesomeIcons.arrowDown91),
                                  title: Text('Next Due Date (Later - Sooner)'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod
                                              .nextDueDateDescending
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                              PopupMenuItem<BillSortingMethod>(
                                value: BillSortingMethod.category,
                                child: ListTile(
                                  leading: Icon(Icons.category_rounded),
                                  title: Text('Category'),
                                  trailing: context
                                              .read<SettingsProvider>()
                                              .getBillTypeSortingMethod(
                                                  widget.billType) ==
                                          BillSortingMethod.category
                                      ? Icon(Icons.check)
                                      : null,
                                ),
                              ),
                            ];
                          },
                        )
                      ],
                    ),
                    Text(
                      '\$${_getTotalCost().currency}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                                      .getBillTypeSortingMethod(
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
