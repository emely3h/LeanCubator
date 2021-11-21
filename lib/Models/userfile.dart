class UserFile{

  String name;
  String link;

  UserFile({
    required this.name,
    required this.link,
  });

  UserFile.fromJson(Map<String, dynamic> json)
      : this(
    name: json['name'] as String,
    link: json['link'] as String,
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'link': link,
  };


}