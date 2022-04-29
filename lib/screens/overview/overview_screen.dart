import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:cashew/screens/overview/widgets/bill_category_card_group.dart';
import 'package:cashew/utilities/double_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  Jiffy _dateToView = Jiffy(DateTime.now());

  List<PieChartSectionData> _generatePieChartSections(DateTime fromWhatDate) {
    Map<BillCategory, double> sections = <BillCategory, double>{};

    List<Bill> bills = context.read<BillProvider>().bills.toList();
    bills.sort((a, b) =>
        a.category.name.toLowerCase().compareTo(b.category.name.toLowerCase()));
    for (var bill in bills) {
      sections.update(
        bill.category,
        (value) => value + bill.getMonthlyCost(givenDate: fromWhatDate),
        ifAbsent: () => bill.getMonthlyCost(givenDate: fromWhatDate),
      );
    }

    List<PieChartSectionData> pieChartSections = <PieChartSectionData>[];
    sections.forEach((key, value) {
      var data = PieChartSectionData(
        value: value,
        title: '\$${value.currency}',
        showTitle: false,
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        color: Global.colors.categoryColors[key],
      );
      pieChartSections.add(data);
    });

    return pieChartSections;
  }

  List<BillCategoryCardGroup> _generateBillCardGroups(DateTime givenDate) {
    List<BillCategoryCardGroup> billCardGroups = [];
    BillCategory.values.forEach(
      (value) => billCardGroups.add(
        BillCategoryCardGroup(
          key: UniqueKey(),
          title: value.name,
          billCategory: value,
          givenDate: givenDate,
        ),
      ),
    );
    return billCardGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.watch<BillProvider>().bills.length == 0
            ? const Text('Welcome To Cashew')
            : const Text('Monthly Nut'),
      ),
      body: context.watch<BillProvider>().bills.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'This app will help you better understand exactly how much money you are spending on bills each month\n\n\nStart by adding some bills below',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Row(
                  children: const [
                    Expanded(
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        size: 36,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                )
              ],
            )
          : Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '\$${context.watch<BillProvider>().bills.map((bill) => bill.getMonthlyCost()).reduce((value, element) => value + element).currency}',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.0),
                    child: Stack(
                      children: [
                        PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 30,
                            sections:
                                _generatePieChartSections(_dateToView.dateTime),
                          ),
                        ),
                        // Center(child: AutoSizeText('\$${242334.0}')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 22.0, bottom: 10, left: 50, right: 50),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        color: context.watch<SettingsProvider>().isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _dateToView = _dateToView.subtract(months: 1);
                              });
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color:
                                  context.watch<SettingsProvider>().isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: AutoSizeText(
                              '${DateFormat(DateFormat.MONTH).format(_dateToView.dateTime)} ${_dateToView.year}',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: context
                                            .watch<SettingsProvider>()
                                            .isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _dateToView = _dateToView.add(months: 1);
                              });
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color:
                                  context.watch<SettingsProvider>().isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView(
                        children: _generateBillCardGroups(_dateToView.dateTime),
                      ),
                    ))
              ],
            ),
    );
  }
}
