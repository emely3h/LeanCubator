import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lean_cubator/Providor/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  late TextEditingController _controller;





  @override
  Widget build(BuildContext context) => Padding(
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
          //controller: _controller,
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thanks!'),
                  content: Text(
                      'You typed "$value", which has length ${value.characters.length}.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),

        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            //Navigator.pushNamed(context, XXXX.id);
          },
          icon: Icon(Icons.login),
          label: Text('Mit Team ID einloggen'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
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