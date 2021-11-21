import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lean_cubator/Models/custom_user.dart';

import 'package:lean_cubator/Pages/home.dart';

import 'package:lean_cubator/Models/team.dart';

import 'package:lean_cubator/Pages/task_page.dart';
import 'package:lean_cubator/Providor/google_sign_in.dart';
import 'package:lean_cubator/Services/firestore.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  late TextEditingController _controller1;
  late CustomUser user;
  late Team team;
  late TextEditingController _controller2;
  late DBFireStore dbFireStore;

  @override
  Widget build(BuildContext context) {
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    dbFireStore = DBFireStore();
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          FlutterLogo(size: 120),
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Servus LeanCubators :)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Einloggen um weiter zu kommen',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Spacer(),
          TextField(
            controller: _controller1,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Enter name'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _controller2,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Enter team id'),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              if (_controller1.text == '' || _controller1.text == '') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: AlertDialog(
                        title: Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.blue,
                        ),
                        content: Text(
                          'Check name and id',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                user = CustomUser(
                    name: _controller1.text,
                    email: '',
                    team: _controller2.text);


                Navigator.pushNamed(context, Home.id);

                team = await dbFireStore.loadTeam(_controller2.text);
                Navigator.pushNamed(context, Home.id);

              }
              ;
            },
            icon: Icon(Icons.login),
            label: Text('Mit Team ID einloggen'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          Spacer(),
          Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.email_outlined),
            label: Text('Mit Email anmelden - ERROR'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
            icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
            label: Text('Mit Google anmelden - ERROR'),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
          ),
          SizedBox(height: 40),
          RichText(
            text: TextSpan(
              text: 'Du hast schon einen Account? ',
              children: [
                TextSpan(
                  text: 'Einloggen',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
