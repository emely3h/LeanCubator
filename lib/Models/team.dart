class Team{

  List<String> userIDs;
  String projectID;

  Team({
    required this.userIDs,
    required this.projectID,
  });

  Team.fromJson(Map<String, dynamic> json)
      : this(
    userIDs: json['userIDs'].cast<String>(),
    projectID: json['projectID'] as String,
  );

  Map<String, dynamic> toJson() => {
    'userIDs': userIDs,
    'projectID': projectID,
  };


}