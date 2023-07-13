import 'package:dsc/profile/settings.dart';
import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  bool _selected = false;
  bool _selected2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 50,
              width: 5,
            ),
            ChoiceChip(
              selected: _selected,
              backgroundColor: Colors.purple[200],
              label: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              avatar: Icon(
                Icons.person,
                color: Colors.purple,
              ),
              onSelected: (bool selected) {
                setState(() {
                  _selected = !_selected;
                });
              },
            ),
            SizedBox(
              height: 40,
              width: 10,
            ),
            ChoiceChip(
              selected: _selected2,
              backgroundColor: Colors.purple[200],
              label: Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              avatar: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onSelected: (bool selected) {
                setState(() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Settings(
                        title: 'Setting',
                      ),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: const Duration(milliseconds: 1000),
                    ),
                  );
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
