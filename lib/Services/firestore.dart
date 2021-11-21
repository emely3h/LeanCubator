import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lean_cubator/Models/chat.dart';
import 'package:lean_cubator/Models/team.dart';
import 'package:lean_cubator/Models/todo.dart';
import 'package:lean_cubator/Models/custom_user.dart';
import 'package:lean_cubator/Models/userfile.dart';

class DBFireStore{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  saveTodoEntry(Todo todo, String taskID, String projectID){
    var todopath = _firestore.collection("project").doc(projectID).collection("task").doc();
    todopath.set(todo.toJson());
  }
  Stream<QuerySnapshot> todoStream(String projectID) {
    return _firestore.collection("project").doc(projectID).collection("task").orderBy('number').snapshots();
  }

  saveChatMessage(Chat chat, String taskID, String projectID){
    var chatpath = _firestore.collection("project").doc(projectID).collection("task").doc(taskID).collection("chats").doc();
    chatpath.set(chat.toJson());
  }
  Stream<QuerySnapshot> chatStream(String taskID, String projectID) {
    return _firestore.collection("project").doc(projectID).collection("task").orderBy('timestamp',descending: true).limitToLast(20).snapshots();
  }


  saveFilesEntry(UserFile file, String taskID, String projectID){
    var filepath = _firestore.collection("project").doc(projectID).collection("task").doc(taskID).collection("files").doc();
    filepath.set(file.toJson());
  }
  Stream<QuerySnapshot> fileStream(String taskID, String projectID) {
    return _firestore.collection("project").doc(projectID).collection("task").snapshots();
  }

  saveUser(UserFile file, String taskID, String projectID){
    var filepath = _firestore.collection("project").doc(projectID).collection("task").doc(taskID).collection("userfiles").doc();
    filepath.set(file.toJson());
  }
  Future<CustomUser> loadCustomUser(String username) async {
    QuerySnapshot<Object> querySnapshot = await _firestore.collection("user").where('user', isEqualTo: username).get();
    return CustomUser.fromJson((querySnapshot.docs.first.data()) as Map<String, dynamic>);//ToDo: Vermutlich fehlerhaft
  }


  Future<Team> loadTeam(String team) async {
    var openingTimes = _firestore.collection("teams").doc(team);
    DocumentSnapshot<Object> documentSnapshot = await openingTimes.get();
    return Team.fromJson(documentSnapshot.data()  as Map<String, dynamic>);
  }

  saveNewTeamMember(String username, String teamName) async{
    Team teamElement;
    var teampath = _firestore.collection("teams").doc(teamName);
    try{
      teamElement = await loadTeam(teamName);
      teamElement.users.add(username);
    }
    catch(e){
      print(e.toString());
      teamElement = Team(users: [username], projectID: teamName);
    }
    teampath.set(teamElement.toJson());
  }


}