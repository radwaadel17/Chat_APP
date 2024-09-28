class Message {
  final String msg ;
  Message({required this.msg});  
  factory Message.fromJson(jsonData){
    return Message(msg: jsonData['msg']);
  }
}