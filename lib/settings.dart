import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Column(
        children: [
          Row(
            children: [
              const Text('Dark'),
              Switch(
                  value: true,
                  onChanged: (bool newBool) {
                    setState(() {
                      isSwitch = newBool;
                    });
                  }),
              const Text('Light'),
            ],
          )
        ],
      ),
    );
  }
}
