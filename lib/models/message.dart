class Message{
  String? avatar;
  String? name;
  String? message;
  bool? status;

  Message({this.avatar, this.name, this.message, this.status});
}

class GroupMessage{
  String? name;
  List<Message>? listMessageGroup;

  GroupMessage({this.name, this.listMessageGroup});
}