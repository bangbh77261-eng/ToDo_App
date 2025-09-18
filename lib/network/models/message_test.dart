class MessageUser {
  String? userName;
  String? content;


  MessageUser({this.userName, this.content});

  MessageUser.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['content'] = content;
    return data;
  }
}
