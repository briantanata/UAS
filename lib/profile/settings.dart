import 'package:dsc/main.dart';
import 'package:flutter/material.dart';

bool darkModeEnabled = false;

class Settings extends StatefulWidget {
  const Settings({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<bool> isOns = [false, false, false, false, false, false];
  List<bool> isOfs = [false, false, false, false, false, false];
  String opsi = "1280 x 720";
  String opsi1 = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "AUDIO",
                        style: TextStyle(
                          color: Color.fromARGB(255, 56, 156, 238),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SwitchListTile(
                    title: Text(
                      "Music",
                    ),
                    selected: isOns[0],
                    secondary: Icon(Icons.music_note),
                    value: isOns[0],
                    onChanged: (bool val) {
                      setState(() {
                        isOns[0] = val;
                      });
                    }),
                SwitchListTile(
                    title: Text(
                      "Sound FX",
                    ),
                    selected: isOns[1],
                    secondary: Icon(Icons.speaker),
                    value: isOns[1],
                    onChanged: (bool val) {
                      setState(() {
                        isOns[1] = val;
                      });
                    }),
                SwitchListTile(
                    title: Text(
                      "Vibration",
                    ),
                    selected: isOns[2],
                    secondary: Icon(
                      Icons.vibration,
                    ),
                    value: isOns[2],
                    onChanged: (bool val) {
                      setState(() {
                        isOns[2] = val;
                      });
                    }),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: const Text(
                          "GRAPHICS",
                          style: TextStyle(
                            color: Color.fromARGB(255, 56, 156, 238),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                SwitchListTile(
                    title: Text(
                      "HD Quality",
                    ),
                    selected: isOns[3],
                    secondary: Icon(
                      Icons.image,
                    ),
                    value: isOns[3],
                    onChanged: (bool val) {
                      setState(() {
                        isOns[3] = val;
                      });
                    }),
                SwitchListTile(
                    title: Text(
                      "Full Screen",
                    ),
                    selected: isOns[4],
                    secondary: Icon(
                      Icons.image,
                    ),
                    value: isOns[4],
                    onChanged: (bool val) {
                      setState(() {
                        isOns[4] = val;
                      });
                    }),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Icon(
                      Icons.image,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                    ),
                    Text(
                      'Resolution',
                    ),
                    const Spacer(),
                    DropdownButton(
                      value: opsi,
                      underline: SizedBox(),
                      items: [
                        DropdownMenuItem(
                          value: "800 x 600",
                          child: Text(
                            '800 x 600',
                          ),
                        ),
                        DropdownMenuItem(
                          value: "1280 x 720",
                          child: Text(
                            '1280 x 720',
                          ),
                        ),
                        DropdownMenuItem(
                          value: "1366 x 760",
                          child: Text(
                            '1366 x 760',
                          ),
                        )
                      ],
                      onChanged: (val) {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: const Text(
                          "NOTTIFICATION",
                          style: TextStyle(
                            color: Color.fromARGB(255, 56, 156, 238),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                SwitchListTile(
                    title: Text(
                      "Push Alarm",
                    ),
                    selected: isOfs[1],
                    secondary: Icon(
                      Icons.alarm,
                    ),
                    value: isOfs[1],
                    onChanged: (bool val) {
                      setState(() {
                        isOfs[1] = val;
                      });
                    }),
                SwitchListTile(
                  secondary: darkModeEnabled == false
                      ? Icon(Icons.dark_mode)
                      : Icon(Icons.light_mode),
                  title: Text(
                    'Gelap Mode',
                  ),
                  value: darkModeEnabled,
                  onChanged: (bool value) {
                    Dsc.themeNotifier.value =
                        Dsc.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                    setState(
                      () {
                        darkModeEnabled = value;
                      },
                    );
                  },
                  // selected: gelap,
                  // secondary: Icon(Icons.dark_mode,
                  //     color: gelap ? Colors.white : Colors.blueGrey),
                  // value: gelap,
                  // onChanged: (bool val) {
                  //   setState(() {
                  //     gelap = val;
                  //   });
                  // },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
