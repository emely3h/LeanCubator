import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'Pages/home.dart';
import 'Pages/settings.dart';
import 'Pages/task_page.dart';
import 'Pages/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'MainPage';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      home: Home(),
      //theme: themProvider.getTheme,
      debugShowCheckedModeBanner: true,
      // OnBoarding open one time
      initialRoute: WelcomePage.id,
      routes: {
        Home.id: (context) => Home(),
        WelcomePage.id: (context) => WelcomePage(),
        
        TaskPage.id: (cotext) => TaskPage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}
