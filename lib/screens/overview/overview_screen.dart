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
  late ScrollController _scrollController = ScrollController();
  bool _appBarPriceVisible = false;

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
        radius: 40,
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
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >= 53) {
          if (!_appBarPriceVisible) {
            setState(() {
              _appBarPriceVisible = true;
            });
          }
        } else {
          if (_appBarPriceVisible) {
            setState(() {
              _appBarPriceVisible = false;
            });
          }
        }
        // setState(() {
        //   _appBarPriceVisible = _scrollController.position.pixels > 53;
        // });
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double monthlyCost = context.watch<BillProvider>().bills.length == 0
        ? 0
        : context
            .watch<BillProvider>()
            .bills
            .map((bill) => bill.getMonthlyCost(givenDate: _dateToView.dateTime))
            .reduce((value, element) => value + element);
    return Scaffold(
      appBar: AppBar(
        title: context.watch<BillProvider>().bills.length == 0
            ? const Text('Welcome To Cashew')
            : const Text('Cashew'),
        actions: [
          Visibility(
            visible: _appBarPriceVisible &&
                context.watch<BillProvider>().bills.length > 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  '\$${monthlyCost.currency}',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
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
          : CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text(
                            '\$${monthlyCost.currency}',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections:
                                _generatePieChartSections(_dateToView.dateTime),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverAppBar(
                  titleSpacing: 8.0,
                  elevation: 2,
                  pinned: true,
                  title: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
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
                            color: context.watch<SettingsProvider>().isDarkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            '${DateFormat(DateFormat.MONTH).format(_dateToView.dateTime).toUpperCase()} ${_dateToView.year}',
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
                            color: context.watch<SettingsProvider>().isDarkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    _generateBillCardGroups(_dateToView.dateTime),
                  ),
                )
              ],
            ),
    );
  }
}
