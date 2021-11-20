import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lean_cubator/Models/chat.dart';
import 'package:lean_cubator/Models/todo.dart';
import 'package:lean_cubator/Models/custom_user.dart';
import 'package:lean_cubator/Models/userfile.dart';

class DBFireStore{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  saveChatMessage(Chat chat, String taskID, String projectID){
    var chatpath = _firestore.collection("project").doc(projectID).collection("task").doc(taskID).collection("chat").doc();
    chatpath.set(chat.toJson());
  }
  Stream<QuerySnapshot> chatStream(String taskID, String projectID) {
    return _firestore.collection("project").doc(projectID).collection("task").orderBy('timestamp',descending: true).limitToLast(20).snapshots();
  }


  saveTodoEntry(Todo todo, String taskID, String projectID){
    var todopath = _firestore.collection("project").doc(projectID).collection("task").doc(taskID).collection("todo").doc();
    todopath.set(todo.toJson());
  }
  Stream<QuerySnapshot> todoStream(String taskID, String projectID) {
    return _firestore.collection("project").doc(projectID).collection("task").orderBy('createdAt',descending: true).limitToLast(20).snapshots();
  }


  saveFilesEntry(UserFile file, String taskID, String projectID){
    var filepath = _firestore.collection("project").doc(projectID).collection("task").doc(taskID).collection("file").doc();
    filepath.set(file.toJson());
  }
  Stream<QuerySnapshot> fileStream(String taskID, String projectID) {
    return _firestore.collection("project").doc(projectID).collection("task").orderBy('createdAt',descending: true).limitToLast(20).snapshots();
  }

  saveUser(UserFile file, String taskID, String projectID){
    var filepath = _firestore.collection("project").doc(projectID).collection("task").doc(taskID).collection("file").doc();
    filepath.set(file.toJson());
  }
  Future<CustomUser> loadOpeningTimes(String userID) async {
    QuerySnapshot<Object> querySnapshot = await _firestore.collection("user").where('user', isEqualTo: userID).get();
    return CustomUser.fromJson((querySnapshot.docs.first.data()) as Map<String, dynamic>);//Vermutlich fehlerhaft
  }



}