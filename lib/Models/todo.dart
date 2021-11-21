class Todo{

  String title;
  String notes;
  bool status;
  int deatlinetime;
  int creationtime;

  Todo({
    required this.notes,
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
    notes: json['notes'] as String
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'status': status,
    'deatlinetime': deatlinetime,
    'creationtime': creationtime,
    'notes': notes
  };
}