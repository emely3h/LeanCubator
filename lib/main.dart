import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'MainPage';

@override
Widget build(BuildContext context) {


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  return MaterialApp(
          //theme: themProvider.getTheme,
          debugShowCheckedModeBanner: true,
          // OnBoarding open one time
          initialRoute: WelcomePage.id,
          routes: {
            WelcomePage.id: (context) => WelcomePage(),
          },

        );
      }
}
