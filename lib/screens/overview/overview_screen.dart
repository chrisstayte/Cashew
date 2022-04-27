import 'package:cashew/providers/bill_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDateTime = DateTime.now();
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
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      '${DateFormat(DateFormat.MONTH).format(currentDateTime)} ${currentDateTime.year}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    color: Colors.blue.shade300,
                    child: Container(
                      color: Colors.green.shade200,
                      child: Center(
                        child: Text('Pie Chart'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red.shade300,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.list,
                          size: 25,
                        ),
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/categoryDetailed')},
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
