import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: SizedBox(
          height: 60,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: SettingsList(
          backgroundColor: Colors.white,
          sections: [
            SettingsSection(
              title: 'Change Theme',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Dark Theme',
                  leading: Stack(
                    children: [
                      Icon(
                        Icons.color_lens,
                        color: Colors.blue,
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: new Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            'Pro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  switchValue: false,
                  onToggle: (bool value) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Notifications',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Achievements',
                  leading: Stack(
                    children: [
                      Icon(
                        Icons.description,
                        color: Colors.blue,
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: new Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            'Pro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  switchValue: false,
                  onToggle: (bool value) {},
                ),
                SettingsTile.switchTile(
                  title: 'Daily Quotes',
                  leading: Icon(
                    Icons.format_quote_sharp,
                  ),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Ads',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Remove Ads',
                  trailing: Text("Pro"),
                  leading: Stack(
                    children: [
                      Icon(
                        Icons.ad_units,
                        color: Colors.blue,
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: new Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            'Pro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  switchValue: false,
                  onToggle: (bool value) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Sync Data',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Sync Your Data With Google',
                  trailing: Text("Pro"),
                  leading: Stack(
                    children: [
                      Icon(
                        Icons.data_usage,
                        color: Colors.blue,
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: new Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            'Pro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  switchValue: false,
                  onToggle: (bool value) {},
                ),
              ],
            ),
            SettingsSection(
              title: "Updates",
              tiles: [
                SettingsTile(
                  leading: Icon(
                    Icons.update,
                    color: Colors.blue,
                  ),
                  title: "Check the latest update",
                  trailing: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.blue,
                    onPressed: () {},
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: "Pro Edition",
              tiles: [
                SettingsTile(
                  leading: Icon(
                    Icons.add_chart,
                    color: Colors.blue,
                  ),
                  title: "\$2.99 Per Month",
                  trailing: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.redAccent,
                    onPressed: () {},
                    child: Text(
                      "Subscribe",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
