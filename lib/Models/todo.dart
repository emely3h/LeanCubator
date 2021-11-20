class Todo{

  String title;
  bool status;
  int deatlinetime;
  int creationtime;

  Todo({
    required this.status,
    required this.title,
    required this.deatlinetime,
    required this.creationtime,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : this(
    title: json['title'] as String,
    status: json['status'] as bool,
    deatlinetime: json['deatlinetime'] as int,
    creationtime: json['creationtime'] as int,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'status': status,
    'deatlinetime': deatlinetime,
    'creationtime': creationtime,
  };


}