class CustomUser{

  String name;
  String email;
  String team;

  CustomUser({
    required this.name,
    required this.email,
    required this.team,
  });

  CustomUser.fromJson(Map<String, dynamic> json)
      : this(
    name: json['name'] as String,
    email: json['email'] as String,
    team: json['team'] as String,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'team': team,
  };


}