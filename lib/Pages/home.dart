import 'package:flutter/material.dart';
import 'package:lean_cubator/Pages/settings.dart';
import 'package:lean_cubator/Pages/task_page.dart';
import 'package:lean_cubator/Pages/test_stage.dart';
import 'package:lean_cubator/Pages/your_project.dart';


class Home extends StatefulWidget {
  static String id = "Layout";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> pages = ['TaskInfoDummy.id', 'SettingsPage.id'];
  Widget current_page = TestStage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leancubator'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Aalto Venture Program'),
            ),
            ListTile(
              title: const Text('Your Project'),
              onTap: () {
                setState(() {
                  current_page = YourProject();
                });
              },
            ),
            ListTile(
              title: const Text('Other Projects'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('TestStage'),
              onTap: () {
                // Update the state of the app.
                // ...
                //Navigator.pushNamed(context, pages[1]);
                setState(() {
                  current_page = TestStage();
                });
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app.
                // ...
               // Navigator.pushNamed(context, pages[1]);
                setState(() {
                  current_page = SettingsPage();
                });
              },
            ),
          ],
        ),
      ),
      body: current_page,
    );
  }
}
