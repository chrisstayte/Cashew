import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditBillScreen extends StatefulWidget {
  const EditBillScreen({Key? key, required this.existingBill})
      : super(key: key);

  final Bill existingBill;

  @override
  State<EditBillScreen> createState() => _EditBillScreenState();
}

class _EditBillScreenState extends State<EditBillScreen> {
  TextEditingController _costController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  late BillType _billType = widget.existingBill.type;
  late DateTime _dueDate = widget.existingBill.startDate;
  late BillCategory _category = widget.existingBill.category;
  late Occurrence _occurrence =
      widget.existingBill.occurrence ?? Occurrence.month;
  late bool _repeat = widget.existingBill.repeat;

  @override
  void initState() {
    _costController.text = widget.existingBill.cost.toString();
    _titleController.text = widget.existingBill.title;

    super.initState();
  }

  @override
  void dispose() {
    _costController.dispose();
    _titleController.dispose();
    //_focusNode.dispose();
    super.dispose();
  }

  void _udpateBill() {
    if (_costController.text.isEmpty) {
      var snackBar = const SnackBar(
        content: Text('Bill requires a cost above 0'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (double.tryParse(_costController.text) == 0) {
      var snackBar = const SnackBar(
        content: Text('Bill requires a cost above 0'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    double cost = double.parse(_costController.text);

    BillType billType = _billType;

    var trimmed = _titleController.text.trim();
    if (trimmed.isEmpty) {
      var snackBar = const SnackBar(
        content: Text('Add a bill name'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    BillCategory billCategory = BillCategory.utility;

    if (billType == BillType.subscription || billType == BillType.financed) {
      billCategory = _category;
    }

    Occurrence? occurrence;
    if (_repeat) {
      occurrence = _occurrence;
    }

    widget.existingBill.title = trimmed;
    widget.existingBill.cost = cost;
    widget.existingBill.category = billCategory;
    widget.existingBill.occurrence = occurrence;
    widget.existingBill.startDate = _dueDate;
    widget.existingBill.type = billType;
    widget.existingBill.repeat = _repeat;

    context.read<BillProvider>().updateBill(widget.existingBill);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Bill'),
        actions: [TextButton(onPressed: _udpateBill, child: Text('Update'))],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 48),
                ),
                IntrinsicWidth(
                  child: TextField(
                    controller: _costController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'))
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    showCursor: false,
                    style: TextStyle(
                      fontSize: 48,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 48,
                        color: context.watch<SettingsProvider>().isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: Text('Utility'),
                  selected: _billType == BillType.utility,
                  onSelected: (value) {
                    setState(() {
                      _billType = BillType.utility;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Subscription'),
                  selected: _billType == BillType.subscription,
                  onSelected: (value) {
                    setState(() {
                      _billType = BillType.subscription;
                    });
                  },
                ),
                // ChoiceChip(
                //   label: Text('Financed'),
                //   selected: _billType == BillType.financed,
                //   onSelected: (value) {
                //     setState(() {
                //       _billType = BillType.financed;
                //     });
                //   },
                // ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.title),
            title: TextField(
              controller: _titleController,
              textCapitalization: TextCapitalization.words,
              style:
                  // subtitle1 was used because this is the default text theme of a 'listTile'
                  Theme.of(context).textTheme.subtitle1?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
              decoration: InputDecoration(
                hintText: 'Name',
                border: InputBorder.none,
              ),
            ),
          ),
          ListTile(
            onTap: () async {
              DateTime? chosen = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 30, 1, 1),
                  lastDate: DateTime(DateTime.now().year + 30, 1, 1),
                  builder: (context, child) {
                    return Theme(
                      data: context.read<SettingsProvider>().isDarkMode
                          ? ThemeData.dark().copyWith(
                              colorScheme: const ColorScheme.dark(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                surface: Colors.black,
                                onSurface: Colors.white,
                              ),
                              dialogBackgroundColor: Colors.black,
                            )
                          : ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.black,
                                onPrimary: Colors.white,
                                surface: Colors.black,
                                onSurface: Colors.black,
                              ),
                              dialogBackgroundColor: Colors.white,
                            ),
                      child: child!,
                    );
                  });
              if (chosen != null) {
                setState(() {
                  _dueDate = chosen;
                });
              }
            },
            title: Text('Due Date'),
            leading: Icon(Icons.calendar_month),
            trailing:
                Text('${_dueDate.month}/${_dueDate.day}/${_dueDate.year}'),
          ),
          Visibility(
            visible: _billType != BillType.utility,
            child: Column(
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.tag),
                  title: Text('Category'),
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _category,
                      onChanged: (Object? value) {
                        setState(() {
                          _category = value as BillCategory;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          child: Text('General'),
                          value: BillCategory.general,
                        ),
                        DropdownMenuItem(
                          child: Text('Auto'),
                          value: BillCategory.auto,
                        ),
                        DropdownMenuItem(
                          child: Text('Entertainment'),
                          value: BillCategory.entertainment,
                        ),
                        DropdownMenuItem(
                          child: Text('Fitness'),
                          value: BillCategory.fitness,
                        ),
                        DropdownMenuItem(
                          child: Text('Food'),
                          value: BillCategory.food,
                        ),
                        DropdownMenuItem(
                          child: Text('Housing'),
                          value: BillCategory.housing,
                        ),
                        DropdownMenuItem(
                          child: Text('Healthcare'),
                          value: BillCategory.healthCare,
                        ),
                        DropdownMenuItem(
                          child: Text('Insurance'),
                          value: BillCategory.insurance,
                        ),
                        DropdownMenuItem(
                          child: Text('Parking'),
                          value: BillCategory.parking,
                        ),
                        DropdownMenuItem(
                          child: Text('Sports'),
                          value: BillCategory.sports,
                        ),
                        DropdownMenuItem(
                          child: Text('Student Loan'),
                          value: BillCategory.studentLoan,
                        ),
                        DropdownMenuItem(
                          child: Text('Telephone'),
                          value: BillCategory.telephone,
                        ),
                        DropdownMenuItem(
                          child: Text('Utility'),
                          value: BillCategory.utility,
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Repeat'),
                  leading: Icon(Icons.repeat),
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        _repeat = value;
                      });
                    },
                    value: _repeat,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _repeat,
            child: ListTile(
              title: Text('Occurence'),
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<Occurrence>(
                  value: _occurrence,
                  items: const [
                    DropdownMenuItem(
                      child: Text('Daily'),
                      value: Occurrence.day,
                    ),
                    DropdownMenuItem(
                      child: Text('Weekly'),
                      value: Occurrence.week,
                    ),
                    DropdownMenuItem(
                      child: Text('Bi Weekly'),
                      value: Occurrence.biweekly,
                    ),
                    DropdownMenuItem(
                      child: Text('Monthly'),
                      value: Occurrence.month,
                    ),
                    DropdownMenuItem(
                      child: Text('Bi-Annually'),
                      value: Occurrence.biannual,
                    ),
                    DropdownMenuItem(
                      child: Text('Yearly'),
                      value: Occurrence.year,
                    ),
                  ],
                  onChanged: (Object? value) {
                    setState(() {
                      _occurrence = value as Occurrence;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
