import 'package:flutter/material.dart';
import 'package:lean_cubator/components/chat_container.dart';

import '../components/file_container.dart';

class TaskPage extends StatefulWidget {
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Card(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
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
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: new TabBarView(
                        controller: _controller,
                        children: <Widget>[
                          Card(
                            child: new ListTile(
                              leading: const Icon(Icons.task),
                              title: new TextField(
                                decoration: const InputDecoration(
                                    hintText: 'Some todos...'),
                              ),
                            ),
                          ),
                          FileContainer(),
                          ChatContainer()
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
