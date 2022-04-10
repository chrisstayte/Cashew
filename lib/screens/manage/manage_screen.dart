import 'package:flutter/material.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'Utilities',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.blueGrey),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.green),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.red.shade300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'Subscriptions',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.blueGrey),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.green),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.red.shade300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'Financed',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(color: Colors.blueGrey),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.green),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.red.shade300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
