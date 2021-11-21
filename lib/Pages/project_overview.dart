import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:lean_cubator/Models/custom_user.dart';
import 'package:lean_cubator/Models/project.dart';

<<<<<<< HEAD
=======
class ProjectData {
  static List<Project> projects = [Project(
        info:
            "info startup1",
        name: "Startup1",
        members: ["Person1", "Person2", "Person3"],
        currentStage: "Stage1",
        active: true),
        Project(
        info:
            "info startup2",
        name: "Startup2",
        members: ["Person1", "Person2", "Person3", "Person4"],
        currentStage: "Stage5",
        active: true),
         Project(
        info:
            "info startup3",
        name: "Startup3",
        members: ["Person1", "Person2"],
        currentStage: "Stage2",
        active: false),
          Project(
        info:
            "info startup4",
        name: "Startup4",
        members: ["Person1", "Person2"],
        currentStage: "Stage6",
        active: true),
        ];
}


>>>>>>> a078349464c85578755b00b516b6d422f7a78d6c
class ProjectOverview extends StatefulWidget {
  @override
  ProjectOverviewState createState() =>
      ProjectOverviewState(projects: ProjectData.projects, users: getUsers());

  static List<CustomUser> getUsers() {
    List<CustomUser> users = [];
    users.add(CustomUser(email: "email1", name: "name1", team: "team1"));
    users.add(CustomUser(email: "email2", name: "name2", team: "team2"));
    users.add(CustomUser(email: "email3", name: "name3", team: "team3"));
    return users;
  }
}

class ProjectOverviewState extends State<ProjectOverview> {
  TextEditingController editingController = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();
  List<Project> projects = [];
  List<Project> viewable = [];

  List<CustomUser> users = [];

  ProjectOverviewState({required this.projects, required this.users}) {
    viewable = projects;
  }

  void addProject(Project project) {
    projects.add(project);
    viewable = projects
        .where((element) =>
            element.name.toLowerCase().contains(currentFilter.toLowerCase()))
        .toList();
  }

  late String currentFilter = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.all(100),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    currentFilter = value;
                    viewable = projects
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: viewable.length,
                    itemBuilder: (BuildContext context, int index) {
                      return createListTile(viewable[index]);
                    })),
            Container(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _displayTextInputDialog(context);
                  },
                ),
              ],
            ),
          ])),
    );
  }

  late String name;
  late List<String> members = [];
  late String info;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Create Project'),
            content: Container(
                child: Column(children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                controller: _textFieldController2,
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextField(
                onChanged: (value) {
                  info = value;
                },
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "info"),
              ),
              // DropdownButton<String>(

              //     items:
              //         users.map<DropdownMenuItem<String>>((CustomUser value) {
              //   return DropdownMenuItem<String>(
              //     value: value.name,
              //     child: Text(value.name),
              //   );
              // }).toList(),
              // onChanged: (val) => setState(() {
              //         print("searchSource:" + val!);
              //         members = val!;
              //       }))
              GFMultiSelect(
                items: users.map<String>((CustomUser value) {
                  return value.name;
                }).toList(),
                onSelect: (value) {
                  members = value
                      .cast<int>()
                      .map<String>((e) => users[e].name)
                      .toList();
                },
              ),
            ])),
            actions: <Widget>[
              ElevatedButton(
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    addProject(Project(
                        name: name,
                        info: info,
                        members: members,
                        currentStage: "",
                        active: true));
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  Widget createListTile(Project project) {
    return Card(
        child: ListTile(
            leading: Icon(Icons.list),
            trailing: Text("Members" + project.members.toString()),
            subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text(project.info)),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        project.currentStage,
                        textAlign: TextAlign.right,
                      ))
                ]),
            title: Text(project.name),
            onTap: () => openProject(project)));
  }

  void openProject(Project project) {}
}
