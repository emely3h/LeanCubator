import 'package:lean_cubator/Models/task.dart';
import 'package:lean_cubator/Models/todo.dart';

class TodoListData {
  static List<Task> list = [
    Task(
        headline: "Interviews",
        body: "Interview Questions",
        help: false,
        number: 0,
        state: 0),
    Task(
        headline: "Surveys", body: "Surveys", help: false, number: 0, state: 0),
    Task(
        headline: "Business plan",
        body: "Business plan",
        help: false,
        number: 0,
        state: 0)
  ];

  static void SetTodos() {
    list[0].todos = [
      Todo(
          notes: "notes",
          deatlinetime: 100000000,
          status: false,
          creationtime: 3,
          title: "Find partner"),
      Todo(
          notes: "notes",
          deatlinetime: 150000000,
          status: false,
          creationtime: 3,
          title: "make interview"),
      Todo(
          notes: "notes",
          deatlinetime: 305000000,
          status: false,
          creationtime: 3,
          title: "evaluate Interview")
    ];
    list[1].todos = [
      Todo(
          notes: "notes",
          deatlinetime: 1000000000,
          status: false,
          creationtime: 3,
          title: "task1"),
      Todo(
          notes: "notes",
          deatlinetime: 1500000000,
          status: false,
          creationtime: 3,
          title: "task2"),
      Todo(
          notes: "notes",
          deatlinetime: 305000000,
          status: false,
          creationtime: 3,
          title: "task3")
    ];
    list[2].todos = [
      Todo(
          notes: "notes",
          deatlinetime: 10000000000,
          status: false,
          creationtime: 3,
          title: "task1"),
      Todo(
          notes: "notes",
          deatlinetime: 15000000000,
          status: false,
          creationtime: 3,
          title: "task2"),
      Todo(
          notes: "notes",
          deatlinetime: 3050000000,
          status: false,
          creationtime: 3,
          title: "task3")
    ];
  }

  static List<Task> getTasks() {
    SetTodos();
    return list;
  }
}
