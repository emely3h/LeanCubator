import 'package:flutter/material.dart';
import 'package:lean_cubator/Models/todolistdata.dart';
import 'package:lean_cubator/Pages/todolist.dart';
import 'package:lean_cubator/components/chat_container.dart';
import 'package:lean_cubator/components/task_info_dummy.dart';

import '../components/file_container.dart';

class TaskPage extends StatefulWidget {
  static String id = "TaskPage";
  @override
  _TaskContainerState createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              TaskInfoDummy(),
              SizedBox(height: 30),
              Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                            color: Theme.of(context).primaryColor),
                        child: new TabBar(
                          controller: _controller,
                          tabs: [
                            new Tab(
                              icon: const Icon(Icons.task),
                              text: 'Todos',
                            ),
                            new Tab(
                              icon: const Icon(Icons.file_copy),
                              text: 'Files',
                            ),
                            new Tab(
                              icon: const Icon(Icons.message),
                              text: 'Chat',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: new TabBarView(
                          controller: _controller,
                          children: <Widget>[
                            TodoList(todoList:TodoListData.getTasks()[0].todos),
                            FileContainer(),
                            ChatContainer()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
