import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/global/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddBillScreen extends StatefulWidget {
  const AddBillScreen({Key? key}) : super(key: key);

  @override
  State<AddBillScreen> createState() => _AddBillScreenState();
}

class _AddBillScreenState extends State<AddBillScreen> {
  final double dividerIndentSize = 15.0;
  BillType selectedBillType = BillType.subscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NEW BILL',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Text(
              '\$123.00',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: Text('Subscription'),
                  selected: selectedBillType == BillType.subscription,
                ),
                ChoiceChip(
                  label: Text('Utility'),
                  selected: selectedBillType == BillType.utility,
                ),
                ChoiceChip(
                  label: Text('Financed'),
                  selected: selectedBillType == BillType.financed,
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.tag),
            title: Text('Category'),
          ),
          Divider(
            indent: dividerIndentSize,
            endIndent: dividerIndentSize,
          ),
          ListTile(
            leading: Icon(Icons.title),
            title: Expanded(child: TextField()),
          ),
          ListTile(
            title: Text('Due Date'),
          ),
          ListTile(
            title: Text('Repeat'),
            trailing: Switch(
              onChanged: (value) {},
              value: true,
            ),
          ),
          ListTile(
            title: Text('Occurence'),
          ),
          ListTile(
            title: Text('End Date'),
            trailing: Switch(
              onChanged: (value) {},
              value: true,
            ),
          ),
          ListTile(
            title: Text('End Date'),
          ),
          ListTile(
            title: Text('Notify'),
            trailing: Switch(
              onChanged: (value) {},
              value: true,
            ),
          )
        ],
      ),
    );
  }
}
