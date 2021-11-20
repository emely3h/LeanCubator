import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lean_cubator/Models/todo.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;
  final _TodoListState parentState;
  TodoWidget({required this.todo, required this.parentState});

  @override
  TodoWidgetState createState() => TodoWidgetState(todo: todo, parentState:parentState);
}

class TodoWidgetState extends State<TodoWidget> {
  Todo todo;
  _TodoListState parentState;
  TodoWidgetState({required this.todo, required this.parentState});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Text(todo.title + ' '),
      Text(DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(todo.creationtime)) + ' '),
      Text(DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(todo.deatlinetime)) + ' '),
      const Text('Finished '),
      Checkbox(
          value: todo.status,
          onChanged: (value) {
            setState(() {
              todo.status = value!;
            });
          }),
                  ElevatedButton(
            child: Text('Remove'),
            onPressed: () {
              parentState._removeItem(todo);
            },
          )
    ])
        //  DateFormat('dd MMMM, yyyy').format(args.value)
        );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // save data
  final List<Todo> _todoList = <Todo>[];
  // text field
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('To-Do List')),
        body: Column(children: [
          Expanded(child: Container(child: ListView(children: _getItems()))),
          ElevatedButton(
            child: Text('Add Item'),
            onPressed: () {
              _displayTextInputDialog(context);
            },
          )
        ]));
  }

  void _removeItem(Todo todo) {
       setState(() {
      _todoList.remove(todo);
    });
  }

  void _addTodoItem(Todo todo) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      _todoList.add(todo);
    });
    _textFieldController.clear();
  }

  // iterates through our todo list title
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (Todo todo in _todoList) {
      // _todoWidgets.add(TodoWidget(todo:todo));
      _todoWidgets.add(TodoWidget(todo: todo,parentState:this));
    }
    return _todoWidgets;
  }

  late int completionTime;
  late String title = "";

  late int _selectedDate;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Create Item'),
            content: Container(
                child: Column(children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                controller: _textFieldController2,
                decoration: InputDecoration(hintText: "Title"),
              ),
              getDateRangePicker()
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
                    _addTodoItem(Todo(
                        creationtime: DateTime.now().millisecondsSinceEpoch,
                        status: false,
                        title: title,
                        deatlinetime: completionTime));
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  Widget getDateRangePicker() {
    return Container(
        width: 200.0,
        height: 200.0,
        child: Card(
            child: SfDateRangePicker(
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: selectionChanged,
        )));
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    completionTime = (args.value as DateTime).millisecondsSinceEpoch;

    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {});
    });
  }
}