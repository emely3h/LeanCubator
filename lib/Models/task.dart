
import 'package:lean_cubator/Models/userfile.dart';

import 'todo.dart';
import 'chat.dart';

class Task{

  String _headline = "";
  String _body = "";
  List<Todo> _todos = [];
  List<Chat> _chats = [];
  List<UserFile> _userfiles = [];
  bool _help = false;



  bool get help => _help;

  set help(bool value) {
    _help = value;
  }

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  List<Todo> get todos => _todos;

  set todos(List<Todo> value) {
    _todos = value;
  }

  List<UserFile> get userfiles => _userfiles;

  set userfiles(List<UserFile> value) {
    _userfiles = value;
  }

  String get headline => _headline;

  set headline(String value) {
    _headline = value;
  }

  List<Chat> get chats => _chats;

  set chats(List<Chat> value) {
    _chats = value;
  }
}