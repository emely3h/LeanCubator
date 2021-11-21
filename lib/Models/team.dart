class Team{

  List<String> users;
  String projectID;

  Team({
    required this.users,
    required this.projectID,
  });

  Team.fromJson(Map<String, dynamic> json)
      : this(
    users: json['users'].cast<String>(),
    projectID: json['projectID'] as String,
  );


  Map<String, dynamic> toJson() => {
    'users': users,
    'projectID': projectID,
  };


}