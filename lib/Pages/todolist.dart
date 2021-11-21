import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lean_cubator/Models/task.dart';
import 'package:lean_cubator/Models/todo.dart';
import 'package:lean_cubator/Models/todolistdata.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;
  final _TodoListState parentState;
  TodoWidget({required this.todo, required this.parentState});

  @override
  TodoWidgetState createState() =>
      TodoWidgetState(todo: todo, parentState: parentState);
}

class TodoWidgetState extends State<TodoWidget> {
  Todo todo;
  _TodoListState parentState;
  TodoWidgetState({required this.todo, required this.parentState});
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _textFieldController.text = todo.notes;
    return Container(
      child: ListTile(
        leading: Checkbox(
            value: todo.status,
            onChanged: (value) {
              setState(() {
                todo.status = value!;
              });
            }),
        title: Column(
          children: [
            Text(todo.title),
            Text(((todo.deatlinetime - todo.creationtime) /
                        (24 * 60 * 60 * 1000))
                    .toStringAsFixed(0) +
                ' Days left'),
          ],
        ),
        trailing: InkWell(
          child: Icon(Icons.delete),
          onTap: () {
            parentState._removeItem(todo);
          },
        ),
        onTap: () {
          _displayTextInputDialog(context);
        },
      ),
      //  DateFormat('dd MMMM, yyyy').format(args.value)
    );
  }

  late String notes;
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Notes'),
            content: Container(
                child: Column(children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (value) {
                  notes = value;
                  todo.notes = value;
                },
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "notes"),
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
                child: Text('Save'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}

class TodoList extends StatefulWidget {
  final List<Todo> todoList;
  TodoList({required this.todoList});
  @override
  _TodoListState createState() => _TodoListState(todoList: todoList);
}

class _TodoListState extends State<TodoList> {
  // save data
  final List<Todo> todoList;
  _TodoListState({required this.todoList});
  // text field
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 300,
          width: 500,
          child: ListView(
            children: _getItems(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
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
        )
      ],
    );
  }

  void _removeItem(Todo todo) {
    setState(() {
      todoList.remove(todo);
    });
  }

  void _addTodoItem(Todo todo) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      todoList.add(todo);
    });
    _textFieldController.clear();
  }

  // iterates through our todo list title
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (Todo todo in todoList) {
      // _todoWidgets.add(TodoWidget(todo:todo));
      _todoWidgets.add(TodoWidget(todo: todo, parentState: this));
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
                        deatlinetime: completionTime,
                        notes: ""));
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
