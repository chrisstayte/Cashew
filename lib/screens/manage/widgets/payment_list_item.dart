import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashew/enum/occurrence.dart';
import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

class PaymentListItem extends StatelessWidget {
  const PaymentListItem({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  bill.title,
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('\$${bill.cost}'),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            bill.getNextPaymentDate(),
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
