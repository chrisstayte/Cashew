import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:cashew/utilities/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

class BillListItem extends StatelessWidget {
  const BillListItem({Key? key, required this.bill, required this.givenDate})
      : super(key: key);

  final Bill bill;
  final DateTime givenDate;

  @override
  Widget build(BuildContext context) {
    DateTime? nextPaymentDate = bill.getNextPaymentDate(givenDate: givenDate);
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/bill', arguments: bill),
        child: Container(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircleAvatar(
              //   backgroundColor: Global.colors.darkIconColor,
              //   child: FaIcon(
              //     bill.icon ?? FontAwesomeIcons.fileInvoiceDollar,
              //     color: Colors.white,
              //   ),
              // ),
              // SizedBox(
              //   width: 10,
              // ),
              Expanded(
                child: AutoSizeText(
                  bill.title,
                  maxLines: 3,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${bill.getMonthlyCost(givenDate: givenDate).currency}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  // Text(
                  //     nextPaymentDate == null
                  //         ? 'Not Due'
                  //         : '${nextPaymentDate.month}/${nextPaymentDate.day}/${nextPaymentDate.year}',
                  //     style: TextStyle(fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
