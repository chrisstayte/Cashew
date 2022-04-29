import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:cashew/screens/overview/widgets/bill_list_Item.dart';
import 'package:cashew/utilities/double_extensions.dart';
import 'package:cashew/utilities/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillCategoryCardGroup extends StatefulWidget {
  const BillCategoryCardGroup({
    Key? key,
    required this.title,
    required this.billCategory,
    required this.givenDate,
  }) : super(key: key);

  final String title;
  final BillCategory billCategory;
  final DateTime givenDate;

  @override
  State<BillCategoryCardGroup> createState() => _BillCategoryCardGroupState();
}

class _BillCategoryCardGroupState extends State<BillCategoryCardGroup> {
  double _getTotalCost() {
    double totalCost = context
        .read<BillProvider>()
        .bills
        .where((bill) => bill.category == widget.billCategory)
        .fold<double>(
            0,
            (previousValue, element) =>
                previousValue +
                element.getMonthlyCost(
                  givenDate: widget.givenDate,
                ));
    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return context
                .watch<BillProvider>()
                .bills
                .where((bill) => bill.category == widget.billCategory)
                .length ==
            0
        ? SizedBox()
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
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
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        widget.billCategory.name.capitalize,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color:
                              Global.colors.categoryColors[widget.billCategory],
                        ),
                        height: 35,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Center(
                            child: Text(
                              '\$${_getTotalCost().currency}',
                              style: TextStyle(
                                  color: Global
                                              .colors
                                              .categoryColors[
                                                  widget.billCategory]!
                                              .computeLuminance() >
                                          0.5
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Column(
                      children: (context
                              .watch<BillProvider>()
                              .bills
                              .where((element) =>
                                  element.category == widget.billCategory)
                              .toList()
                            ..sort((a, b) => a.title.compareTo(b.title)))
                          .map<BillListItem>(
                            (bill) => BillListItem(
                              bill: bill,
                              givenDate: widget.givenDate,
                            ),
                          )
                          .toList()),
                ]),
              ),
            ),
          );
  }
}
