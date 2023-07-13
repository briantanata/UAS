//import 'package:Dsc/view.dart';
import 'package:dsc/detail_film/booking.dart';
import 'package:dsc/detail_film/moviedata.dart';
import 'package:dsc/login_ui/login_ui_page.dart';
import 'package:dsc/profile/profile.dart';
import 'package:dsc/profile/settings.dart';
import 'package:dsc/providers/filmProviders.dart';
import 'package:dsc/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserLoginProvider()),
    ChangeNotifierProvider(create: (_) => FilmProvider()),
    //
    //
    //
    //
  ], child: const Dsc()));
}

class Dsc extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const Dsc({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.purple),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: LoginUiPage(),
          );
        });
  }
}
