import 'package:dangnhap_lms/search_message.dart';
import 'package:flutter/material.dart';
import 'package:dangnhap_lms/models/message.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'custom_icons.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/message_content.dart';
import 'package:dangnhap_lms/send_new_message.dart';
import 'package:intl/intl.dart';

class MyMessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessagePage();
  }
}

enum Actions { more, delete, notification }

class MessageController extends GetxController{
  final Rx<Message> message = Message().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class MessagePage extends State<MyMessagePage> {
  TabController? _tabController;
  int _selectedPageIndex = 0;
  FocusNode SearchFocus = FocusNode();
  final controller = Get.put(MessageController());
  AllMessage allMessage = AllMessage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(248, 129, 37, 1),
            title: Text(
              "Tin Nhắn",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            actions: [
              IconButton(
                icon: Image.asset("assets/Images/icon_edit_message.png"),
                onPressed: () {
                  Get.to(MySendNewMessage());
                },
              )
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              child: Column(
                children: [
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      color: Color.fromRGBO(246, 246, 246, 1),
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextFormField(
                        onTap: () {
                          Get.to(MySearchMessage(),arguments: allMessage.listAllMessage);
                          SearchFocus.unfocus();
                          print(allMessage.listAllMessage.length);
                        },
                        focusNode: SearchFocus,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 16),
                          hintText: "Tìm tin nhắn...",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(177, 177, 177, 1)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(177, 177, 177, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Color.fromRGBO(248, 129, 37, 1),
                      )),

                  TabBar(
                      physics: const NeverScrollableScrollPhysics(),
                      indicatorColor: Color.fromRGBO(248, 129, 37, 1),
                      indicatorWeight: 2,
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      onTap: (index) {
                        setState(() {
                          _selectedPageIndex = index;
                        });
                      },
                      tabs: [
                        Container(
                          height: 60,
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tất cả  ",
                                style: TextStyle(
                                    color: _selectedPageIndex == 0
                                        ? Color.fromRGBO(248, 129, 37, 1)
                                        : Color.fromRGBO(26, 26, 26, 1),
                                    fontSize: 14),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _selectedPageIndex == 0
                                        ? Color.fromRGBO(248, 129, 37, 1)
                                        : Color.fromRGBO(177, 177, 177, 1)),
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  "02",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Chưa đọc  ",
                                style: TextStyle(
                                    color: _selectedPageIndex == 1
                                        ? Color.fromRGBO(248, 129, 37, 1)
                                        : Color.fromRGBO(26, 26, 26, 1),
                                    fontSize: 14),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: _selectedPageIndex == 1
                                        ? Color.fromRGBO(248, 129, 37, 1)
                                        : Color.fromRGBO(177, 177, 177, 1)),
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  "03",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                  Expanded(child: IndexedStack(
                    children: <Widget>[
                      Visibility(
                        child: Container(
                          child: AllMessage(),
                        ),
                        maintainState: true,
                        visible: _selectedPageIndex == 0,
                      ),
                      Visibility(
                        child: SizedBox(
                          height: 500,
                          child: Center(
                            child: Unread(),
                          ),
                        ),
                        maintainState: true,
                        visible: _selectedPageIndex == 1,
                      ),
                    ],
                    index: _selectedPageIndex,
                  ))
                  // TabBarView(children: [
                  //   SizedBox(
                  //     height: 500,
                  //     child: AllMessage(),
                  //   ),
                  //   AllMessage(),
                  // ])
                ],
              ),
            ),
          ),
        ));
  }
}

class AllMessage extends StatelessWidget {
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
        status: true),
    Message(
        name: "Đặng Văn Bình 3",
        avatar: "assets/Images/fake_avatar_message_1.png",
        message: "You: Ok, See you in To… ! ",
        status: false),
    Message(
        name: "Đặng Văn Bình 4",
        avatar: "assets/Images/fake_avatar_message_5.png",
        message: "You: Ok, See you in To… ! ",
        status: true),
    Message(
        name: "Đặng Văn Bình 5",
        avatar: "assets/Images/fake_avatar_message_6.png",
        message: "You: Ok, See you in To… ! ",
        status: false),
    Message(
        name: "Đặng Văn Bình 6",
        avatar: "assets/Images/fake_avatar_message_7.png",
        message: "You: Ok, See you in To… ",
        status: true),
    Message(
        name: "Đặng Văn Bình 7",
        avatar: "assets/Images/fake_avatar_message_8.png",
        message: "You: Ok, See you in To… ",
        status: false),
  ];
  Message message = Message();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listAllMessage.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              message = listAllMessage[index];
              Get.to(MyMessageContent(),arguments: message);
              print(message);
            },
            child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 1,
                      onPressed: (context) =>
                          _onClickSlidable(index, Actions.more),
                      backgroundColor: Color.fromRGBO(248, 129, 37, 1),
                      foregroundColor: Colors.white,
                      icon: CustomIcons.more,
                    ),
                    SlidableAction(
                      flex: 1,
                      onPressed: (context) =>
                          _onClickSlidable(index, Actions.notification),
                      backgroundColor: Color.fromRGBO(248, 129, 37, 1),
                      foregroundColor: Colors.white,
                      icon: CustomIcons.notifications,
                    ),
                    SlidableAction(
                      flex: 1,
                      onPressed: (context) =>
                          _onClickSlidable(index, Actions.delete),
                      backgroundColor: Color.fromRGBO(248, 129, 37, 1),
                      foregroundColor: Colors.white,
                      icon: CustomIcons.delete_conversation,
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset("${listAllMessage[index].avatar}"),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Column(
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              "${listAllMessage[index].name}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "${listAllMessage[index].message} \. ${DateFormat.jm().format(DateTime.now())}",
                              style: TextStyle(
                                  color: listAllMessage[index].status == true
                                      ? Color.fromRGBO(26, 26, 26, 1)
                                      : Color.fromRGBO(133, 133, 133, 1),
                                  fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.circle,
                        color: listAllMessage[index].status == true
                            ? Color.fromRGBO(248, 129, 37, 1)
                            : Colors.white,
                        size: 18,
                      )
                    ],
                  ),
                )),
          );
        });
  }

  void _onClickSlidable(int index, Actions actions) {}
}

class Unread extends StatelessWidget {
  List<Message> listAllMessage = <Message>[
    Message(
        name: "Đặng Văn Bình",
        avatar: "assets/Images/fake_avatar_message_1.png",
        message: "What’s man! ",
        status: true),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: listAllMessage.length,
        itemBuilder: (context, index) {
          return Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 1,
                    onPressed: (context) =>
                        _onClickSlidable(index, Actions.more),
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                  ),
                  SlidableAction(
                    flex: 1,
                    onPressed: (context) =>
                        _onClickSlidable(index, Actions.notification),
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.notifications,
                  ),
                  SlidableAction(
                      flex: 1,
                      onPressed: (context) =>
                          _onClickSlidable(index, Actions.delete),
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.delete),
                ],
              ),
              child: Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset("${listAllMessage[index].avatar}"),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            "${listAllMessage[index].name}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            "${listAllMessage[index].message}",
                            style: TextStyle(
                                color: listAllMessage[index].status == true
                                    ? Color.fromRGBO(26, 26, 26, 1)
                                    : Color.fromRGBO(133, 133, 133, 1),
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.circle,
                      color: listAllMessage[index].status == true
                          ? Color.fromRGBO(248, 129, 37, 1)
                          : Colors.white,
                      size: 18,
                    )
                  ],
                ),
              ));
        });
  }

  void _onClickSlidable(int index, Actions actions) {}
}
