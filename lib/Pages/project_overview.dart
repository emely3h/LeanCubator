import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lean_cubator/Models/project.dart';

void main() {
  runApp(OV());
}

class OV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProjectOverview());
  }
}

class ProjectOverview extends StatefulWidget {
  @override
  ProjectOverviewState createState() =>
      ProjectOverviewState(projects: getProjects());

  static List<Project> getProjects() {
    List<Project> projects = [];
    projects.add(Project(
        info:
            "Das ist die info asdfsadfkösajdfasjdlfjasödfjsaöjdfkasdföjaskldjf",
        name: "ProjectName",
        members: ["Janis", "Richard", "Andreas"],
        currentStage: "Stage2",
        active: true));
    projects.add(Project(
        info: "Das ist die Info 2",
        name: "ProjectName2",
        members: ["Janis2", "Richard2", "Andreas2"],
        currentStage: "Stage2",
        active: false));
    projects.add(Project(
        info: "Das ist die Info 2",
        name: "ProjectName2",
        members: ["Janis2", "Richard2", "Andreas2"],
        currentStage: "Stage2",
        active: false));
    projects.add(Project(
        info: "Das ist die Info 2",
        name: "ProjectName2",
        members: ["Janis2", "Richard2", "Andreas2"],
        currentStage: "Stage2",
        active: true));
    projects.add(Project(
        info: "Das ist die Info 2",
        name: "ProjectName2",
        members: ["Janis2", "Richard2", "Andreas2"],
        currentStage: "Stage2",
        active: false));
    projects.add(Project(
        info: "Das ist die Info 2",
        name: "ProjectName2",
        members: ["Janis2", "Richard2", "Andreas2"],
        currentStage: "Stage2",
        active: false));
    projects.add(Project(
        info: "Das ist die Info 2",
        name: "ProjectName2",
        members: ["Janis2", "Richard2", "Andreas2"],
        currentStage: "Stage2",
        active: false));

    return projects;
  }
}

class ProjectOverviewState extends State<ProjectOverview> {
  TextEditingController editingController = TextEditingController();
  List<Project> projects = [];
  List<Project> viewable = [];

  ProjectOverviewState({required this.projects}) {
    viewable = projects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Overview')),
        body: Column(children: [
          Container(
            child: TextField(
              onChanged: (value) {
                setState(() {
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
                  }))
        ]));
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
