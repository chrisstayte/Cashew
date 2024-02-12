import 'package:cashew/enum/bill_category.dart';
import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/providers/bill_provider.dart';
import 'package:cashew/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddBillScreen extends StatefulWidget {
  const AddBillScreen({Key? key}) : super(key: key);

  @override
  State<AddBillScreen> createState() => _AddBillScreenState();
}

// TODO: Need to verify end date is after start date
class _AddBillScreenState extends State<AddBillScreen> {
  FocusNode _focusNode = new FocusNode();

  TextEditingController _costController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  BillType _billType = BillType.subscription;
  DateTime? _dueDate;
  DateTime? _endDate;
  BillCategory _category = BillCategory.general;
  Occurrence _occurrence = Occurrence.month;
  bool _repeat = false;
  bool _stop = false;

  bool _numVisible = false;
  // bool _notify = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _numVisible = _focusNode.hasFocus;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _costController.dispose();
    _titleController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addBill() {
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

    if (_dueDate == null) {
      var snackBar = const SnackBar(
        content: Text('Bill requires a due date'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    Occurrence? occurrence;
    if (_repeat) {
      occurrence = _occurrence;
    }

    Bill newBill = Bill(
      title: trimmed,
      cost: cost,
      category: billCategory,
      dateCreated: DateTime.now(),
      occurrence: occurrence,
      notify: false,
      startDate: _dueDate!,
      type: billType,
      repeat: _repeat,
    );

    context.read<BillProvider>().createBill(newBill);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Bill',
        ),
        actions: [
          TextButton(
              onPressed: _addBill,
              child: Text(
                'Add',
              ))
        ],
      ),
      bottomSheet: Visibility(
        visible: _numVisible,
        child: Container(
          color: context.watch<SettingsProvider>().isDarkMode
              ? Colors.black12
              : CupertinoColors.systemGrey4,
          height: 45,
          child: Row(children: [
            Spacer(),
            TextButton(
                onPressed: () {
                  _focusNode.unfocus();
                },
                child: Text(
                  'Done',
                ))
          ]),
        ),
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
                    focusNode: _focusNode,
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
              );
              if (chosen != null) {
                setState(() {
                  _dueDate = chosen;
                });
              }
            },
            title: Text('Due Date'),
            leading: Icon(Icons.calendar_month),
            trailing: _dueDate == null
                ? Icon(Icons.edit_calendar)
                : Text('${_dueDate!.month}/${_dueDate!.day}/${_dueDate!.year}'),
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
                      dropdownColor:
                          context.watch<SettingsProvider>().isDarkMode
                              ? CupertinoColors.darkBackgroundGray
                              : Colors.white,
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
              ],
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
          // Visibility(
          //   visible: _repeat,
          //   child: ListTile(
          //     title: Text('Stop'),
          //     trailing: Switch(
          //       onChanged: (value) {
          //         setState(() {
          //           _stop = value;
          //           _endDate = null;
          //         });
          //       },
          //       value: _stop,
          //     ),
          //   ),
          // ),
          // Visibility(
          //   visible: _repeat && _stop,
          //   child: ListTile(
          //     onTap: () async {
          //       DateTime? chosen = await showDatePicker(
          //           context: context,
          //           initialDate: DateTime.now(),
          //           firstDate: DateTime(DateTime.now().year - 30, 1, 1),
          //           lastDate: DateTime(DateTime.now().year + 30, 1, 1),
          //           builder: (context, child) {
          //             return Theme(
          //               data: context.read<SettingsProvider>().isDarkMode
          //                   ? ThemeData.dark().copyWith(
          //                       colorScheme: ColorScheme.dark(
          //                         primary: Global.colors.lightIconColor,
          //                         onPrimary: Colors.black,
          //                         surface: Global.colors.darkIconColor,
          //                         onSurface: Colors.white,
          //                       ),
          //                       dialogBackgroundColor:
          //                           Global.colors.darkIconColor,
          //                     )
          //                   : ThemeData.light().copyWith(
          //                       colorScheme: ColorScheme.light(
          //                         primary: Global.colors.darkIconColor,
          //                         onPrimary: Colors.white,
          //                         surface: Global.colors.darkIconColor,
          //                         onSurface: Colors.black,
          //                       ),
          //                       dialogBackgroundColor:
          //                           Global.colors.lightIconColor,
          //                     ),
          //               child: child!,
          //             );
          //           });
          //       if (chosen != null) {
          //         setState(() {
          //           _endDate = chosen;
          //         });
          //       }
          //       print({chosen?.month, chosen?.day, chosen?.year});
          //     },
          //     title: Text('End Date'),
          //     trailing: _endDate == null
          //         ? Icon(Icons.edit_calendar)
          //         : Text(
          //             '${_endDate!.month}/${_endDate!.day}/${_endDate!.year}'),
          //   ),
          // ),

          // ListTile(
          //   title: Text('Notify'),
          //   leading: Icon(Icons.notifications),
          //   trailing: Switch(
          //     onChanged: (value) {
          //       setState(() {
          //         _notify = value;
          //       });
          //     },
          //     value: _notify,
          //   ),
          // )
        ],
      ),
    );
  }
}
