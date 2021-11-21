class Project {
  String name;
  String info;
  String currentStage;
  List<String> members;
  bool active;

    Project({
    required this.name,
    required this.info,
    required this.members,
    required this.currentStage,
    required this.active
  });
}