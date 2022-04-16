import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class CategoryDetailedScreen extends StatefulWidget {
  const CategoryDetailedScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDetailedScreen> createState() => _CategoryDetailedScreenState();
}

class _CategoryDetailedScreenState extends State<CategoryDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CATEGORY DETAILED')),
      body: Container(
        child: Column(
          children: [
            TextButton(
              child: Text('Add Dummy Data'),
              onPressed: () {
                context.read<BillProvider>().addDummyData();
              },
            ),
            TextButton(
                onPressed: () => context.read<BillProvider>().deleteAllBills(),
                child: Text('Delete All Bills')),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                    title:
                        Text(context.read<BillProvider>().bills[index].title)),
                separatorBuilder: (_, __) => SizedBox(
                  height: 01,
                ),
                itemCount: context.watch<BillProvider>().bills.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
