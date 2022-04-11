import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({Key? key}) : super(key: key);

  final double cardPadding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Utilities',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('\$150'),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue.shade300,
                                  child: Icon(
                                    Icons.water_drop,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Water',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$50')
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '12/25/22',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange.shade500,
                                  child: Icon(
                                    Icons.local_fire_department,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gas',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$50')
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '12/25/22',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.yellow.shade600,
                                  child: FaIcon(
                                    FontAwesomeIcons.boltLightning,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Electricity',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$50')
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '12/25/22',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.brown.shade600,
                                  child: FaIcon(
                                    FontAwesomeIcons.poop,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sewer',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$50')
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '12/25/22',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green.shade600,
                                  child: FaIcon(
                                    FontAwesomeIcons.recycle,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Recycling',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$50')
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '12/25/22',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subscriptions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('\$500')
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Financed',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('\$500')
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        // body: Column(
        //   children: [
        //     Expanded(
        //       flex: 1,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Padding(
        //             padding: EdgeInsets.symmetric(
        //               vertical: 18.0,
        //               horizontal: 16.0,
        //             ),
        //             child: Text(
        //               'Utilities',
        //               style: TextStyle(
        //                 fontSize: 24,
        //               ),
        //             ),
        //           ),
        //           Expanded(
        //             child: Row(
        //               children: [
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.green),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.red.shade300),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Padding(
        //             padding: EdgeInsets.symmetric(
        //               vertical: 18.0,
        //               horizontal: 16.0,
        //             ),
        //             child: Text(
        //               'Subscriptions',
        //               style: TextStyle(
        //                 fontSize: 24,
        //               ),
        //             ),
        //           ),
        //           Expanded(
        //             child: Row(
        //               children: [
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.blueGrey),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.green),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.red.shade300),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Padding(
        //             padding: EdgeInsets.symmetric(
        //               vertical: 18.0,
        //               horizontal: 16.0,
        //             ),
        //             child: Text(
        //               'Financed',
        //               style: TextStyle(
        //                 fontSize: 24,
        //               ),
        //             ),
        //           ),
        //           Expanded(
        //             child: Row(
        //               children: [
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.blueGrey),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.green),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   flex: 1,
        //                   child: Padding(
        //                     padding: EdgeInsets.all(cardPadding),
        //                     child: Container(color: Colors.red.shade300),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
