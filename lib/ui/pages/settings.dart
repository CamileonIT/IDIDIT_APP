import 'package:flutter/material.dart';
import 'package:recovery/ui/utils/util.dart';
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
        title: SizedBox(
          height: 60,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Image.asset('assets/images/icon_school-bell.png',
              color: PaypalColors.DarkBlue)
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SettingsList(
          backgroundColor: Colors.white,
          sections: [
            SettingsSection(
              title: 'Change Theme',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Dark Theme',
                  leading: Icon(Icons.color_lens),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Notifications',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Achievements',
                  leading: Icon(Icons.description),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
                SettingsTile.switchTile(
                  title: 'Daily Quotes',
                  leading: Icon(Icons.format_quote_sharp),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
