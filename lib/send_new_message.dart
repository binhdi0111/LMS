import 'package:flutter/material.dart';
import 'package:dangnhap_lms/models/message.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/send_new_message_content.dart';

class MySendNewMessage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SendNewMessage();
  }

}

class SendNewMessage extends State<MySendNewMessage>{
  List<Message> list = <Message>[
    Message(
        name: "Đình Trung",
        status: true,
        message: "hihihi",
        avatar: "assets/Images/avatar_recently_1.png"),
    Message(
        name: "Trần Hữu Phước",
        status: true,
        message: "hihihi",
        avatar: "assets/Images/avatar_recently_2.png"),
    Message(
        name: "Ái Quốc",
        status: true,
        message: "hihihi",
        avatar: "assets/Images/avatar_recently_3.png"),
  ];
  List<Message> listAllMessage = <Message>[
    Message(
        name: "Đặng Văn Bình",
        avatar: "assets/Images/fake_avatar_message_1.png",
        message: "What’s man! ",
        status: true),
    Message(
        name: "Đặng Văn Bình 1",
        avatar: "assets/Images/fake_avatar_message_2.png",
        message: "What’s man! ",
        status: false),
    Message(
        name: "Đặng Văn Bình 2",
        avatar: "assets/Images/fake_avatar_message_3.png",
        message: "You: Ok, See you in To… ! ",
        status: false),
    Message(
        name: "Đặng Văn Bình 3",
        avatar: "assets/Images/fake_avatar_message_1.png",
        message: "You: Ok, See you in To… ! ",
        status: false),
    Message(
        name: "Đặng Văn Bình 4",
        avatar: "assets/Images/fake_avatar_message_5.png",
        message: "You: Ok, See you in To… ! ",
        status: false),
    Message(
        name: "Đặng Văn Bình 5",
        avatar: "assets/Images/fake_avatar_message_6.png",
        message: "You: Ok, See you in To… ! ",
        status: false),
    Message(
        name: "Đặng Văn Bình 6",
        avatar: "assets/Images/fake_avatar_message_7.png",
        message: "You: Ok, See you in To… ",
        status: false),
    Message(
        name: "Đặng Văn Bình 7",
        avatar: "assets/Images/fake_avatar_message_8.png",
        message: "You: Ok, See you in To… ",
        status: false),
  ];
  TextEditingController? _textEditingController;
  bool hasText = false;
  List<Message> messageFilter = <Message>[];
  Message message = Message();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageFilter = listAllMessage;
  }
  void searchMessage(String query) {
    List<Message> resultSearchMessage = <Message>[];
    if (query.isEmpty) {
      resultSearchMessage = listAllMessage;
    } else {
      resultSearchMessage = listAllMessage
          .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    }
    messageFilter = resultSearchMessage;
  }



  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(248, 129, 37, 1),
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text("Gửi tin nhắn mới",style: TextStyle(color: Colors.white,fontSize: 16),),
            actions: [
              IconButton(
                icon: Icon(Icons.home,color: Colors.white,),
                onPressed: () {
                },
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 246, 246, 1),
                  borderRadius: BorderRadius.circular(6)
                ),
                margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextFormField(
                  onTap: () {

                  },
                  onChanged: (text) {
                    setState(() {
                      if (text.isEmpty) {
                        hasText = false;
                      } else {
                        hasText = true;
                      }
                    });
                    searchMessage(text);
                  },
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Đến: ',style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1),fontSize: 16),),
                        )
                      ],),
                    border: InputBorder.none,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Color.fromRGBO(248, 129, 37, 1),
                ),
              ),
              Visibility(
                visible: hasText == false,
                child: Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Image.asset("assets/Images/icon_group_message.png"),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text("Tạo nhóm mới",style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1),fontSize: 16)),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(248, 129, 37, 1),),
                    Padding(padding: EdgeInsets.only(right: 16)),
                  ],
                ),
              ),),
              Visibility(
                visible: hasText == true,
                  child: Container(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: messageFilter.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              message = listAllMessage[index];
                              Get.to(MySendNewMessageContent(),arguments: message);
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                  EdgeInsets.only(top: 16, left: 16),
                                  child: Row(
                                    children: [
                                      Image.asset("${messageFilter[index].avatar}"),
                                      Padding(
                                          padding:
                                          EdgeInsets.only(left: 8)),
                                      Text(
                                        "${messageFilter[index].name}",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                26, 26, 26, 1),
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        }),),
                  )),

              Visibility(
                visible: hasText == false,
                child: Container(
                margin: EdgeInsets.only(top: 20, left: 16),
                child: Text(
                  "Gợi ý",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(177, 177, 177, 1)),
                ),
              ),),
              Visibility(
                visible: hasText == false,
                child: Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin:
                            EdgeInsets.only(top: 16, left: 16),
                            child: Row(
                              children: [
                                Image.asset("${list[index].avatar}"),
                                Padding(
                                    padding:
                                    EdgeInsets.only(left: 8)),
                                Text(
                                  "${list[index].name}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          26, 26, 26, 1),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    }),
              ),)
            ],
          ),
        )
    );
  }

}