class Chat{

  String username;
  String message;
  int timestamp;

  Chat({
    required this.username,
    required this.message,
    required this.timestamp,
  });

  Chat.fromJson(Map<String, dynamic> json)
      : this(
    username: json['username'] as String,
    message: json['message'] as String,
    timestamp: json['timestamp'] as int,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'message': message,
    'timestamp': timestamp,
  };


}