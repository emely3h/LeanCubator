import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lean_cubator/Widget/logged_in_widget.dart';
import 'package:lean_cubator/Widget/sign_up_widget.dart';


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasData) {
//           return LoggedInWidget();
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Something Went Wrong!'));
//         } else {
//           return SignUpWidget();
//         }
//       },
//     ),
//   );
// }


class WelcomePage extends StatefulWidget {

  static String id = "WelcomePage";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return LoggedInWidget();
        } else if (snapshot.hasError) {
          return Center(child: Text('Something Went Wrong!'));
        } else {
          return SignUpWidget();
        }
      },
    ),
  );
}
