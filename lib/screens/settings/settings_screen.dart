import 'package:cashew/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
      buildSignature: 'Unknown');

  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    await PackageInfo.fromPlatform()
        .then((value) => setState(() => _packageInfo = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'General',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              onChanged: (value) =>
                  context.read<SettingsProvider>().setIsDarkMode(value),
              value: context.watch<SettingsProvider>().isDarkMode,
            ),
          ),
          ListTile(
            title: Text(
              'FAQ',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.envelope),
            title: Text('cashew@chrisstayte.com'),
            onTap: () async {
              final Uri params = Uri(
                scheme: 'mailto',
                path: 'cashew@chrisstayte.com',
                query: 'subject=App Feedback (${_packageInfo.version})',
              );
              final String url = params.toString();
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          AboutListTile(
            icon: FaIcon(FontAwesomeIcons.fileLines),
            child: const Text('License'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.github),
            title: Text('Repo'),
            onTap: () async {
              final Uri params = Uri(
                scheme: 'https',
                path: 'www.github.com/ChrisStayte/Cashew',
              );
              final String url = params.toString();

              if (await canLaunch(url)) {
                await launch(url).catchError((error) {
                  print(error);
                  return false;
                });
              }
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleInfo),
            title: Text('${_packageInfo.version}'),
          ),
          ListTile(
            leading: Icon(Icons.flutter_dash_outlined),
            title: Text('Made with flutter!'),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  border: Border.all(
                    width: .8,
                    color: context.watch<SettingsProvider>().isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What is a monthly nut?',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      'Your “monthly nut” is simply what you and your family spend each month. It is made up of three key pieces: \n\nFixed expenses — These are your family\'s main “operating expenses” — things like housing, utilities, groceries, going out (occasionally), etc. that let you function on a daily basis.\n\nVariable expenses — These expenses are less predictable and, to some degree, less critical: travel, bigger situational clothing purchases, books, furniture, etc.\n\nDebt — This category includes every kind of debt — credit cards, vehicle, homes, etc.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
