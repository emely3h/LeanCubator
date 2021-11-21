
import 'package:lean_cubator/Models/userfile.dart';

import 'todo.dart';
import 'chat.dart';

class Task{

  String headline = "";
  String body = "";
  num number = 0;
  int state = 0;
  List<Todo> _todos = [];
  List<Chat> _chats = [];
  List<UserFile> _userfiles = [];
  bool help = false;

  Task({
    required this.headline,
    required this.body,
    required this.number,
    required this.help,
    required this.state
  });

  Task.fromJson(Map<String, dynamic> json)
      : this(
    headline: json['headline'] as String,
    body: json['body'] as String,
    number: json['number'] as num,
    state: json['state'] as int,
    help: json['help'] as bool,
  );

  Map<String, dynamic> toJson() => {
    'headline': headline,
    'body': body,
    'number': number,
    'state': state,
    'help': help,
  };



  List<Todo> get todos => _todos;

  set todos(List<Todo> value) {
    _todos = value;
  }

  List<UserFile> get userfiles => _userfiles;

  set userfiles(List<UserFile> value) {
    _userfiles = value;
  }

  List<Chat> get chats => _chats;

  set chats(List<Chat> value) {
    _chats = value;
  }
}