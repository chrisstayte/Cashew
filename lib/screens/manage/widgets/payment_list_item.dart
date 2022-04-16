import 'package:cashew/global/global.dart';
import 'package:cashew/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentListItem extends StatelessWidget {
  const PaymentListItem({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  String getNextPaymentDate() {
    DateTime currentDate = DateTime.now();

    if (currentDate.difference(bill.startDate).inDays == 0) {
      return 'Today';
    }

    return currentDate.toString();
  }

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bill.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('\$${bill.cost}'),
            ],
          ),
          Spacer(),
          Text(
            getNextPaymentDate(),
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
