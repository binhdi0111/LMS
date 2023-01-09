import 'package:dangnhap_lms/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'custom_icons.dart';
import 'package:dangnhap_lms/message_content.dart';

class MySearchMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchMessage();
  }
}

class SearchMessageController extends GetxController {
  final Rx<Message> item = Message().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

enum Actions { more, delete, notification }

class SearchMessage extends State<MySearchMessage> {
  final controller = Get.put(SearchMessageController());
  List<Message> listPersonal = <Message>[
    Message(
        name: "Samsung",
        status: true,
        message: "hihihi",
        avatar: "assets/Images/avatar_recently_1.png"),
    Message(
        name: "Airbnb",
        status: true,
        message: "hihihi",
        avatar: "assets/Images/avatar_recently_2.png"),
    Message(
        name: "Apple",
        status: true,
        message: "hihihi",
        avatar: "assets/Images/avatar_recently_3.png"),
  ];
  List<Message> listGroup1 = [];
  List<Message> listGroup2 = [];
  TabController? _tabController;
  int _selectedPageIndex = 0;
  TextEditingController? _textEditingController;
  bool hasText = false;
  var arguments = Get.arguments;
  List<Message> messageFilter = <Message>[];
  List<GroupMessage> groupMessage = <GroupMessage>[];
  List<GroupMessage> groupMessageFilter = <GroupMessage>[];
  Message message = Message();
  @override
  void initState() {
    super.initState();
    print("hahahahhahah${arguments}");
    messageFilter = arguments;
    print("hoooooooo${messageFilter[0].name}");
    List<Message> message = <Message>[];
    message = arguments;
    listGroup1 = message.where((element) => element.status == true).toList();
    listGroup2 = message.where((element) => element.status == false).toList();
    groupMessage.add(GroupMessage(
      name: "hội học sinh lớp 9A",
      listMessageGroup: listGroup1
    ));
    groupMessage.add(GroupMessage(
        name: "hội học sinh lớp 12A2",
        listMessageGroup: listGroup2
    ));

  }
  void searchMessageGroup(String query){
    List<GroupMessage> resultSearchMessage = <GroupMessage>[];
    if (query.isEmpty) {
      resultSearchMessage = groupMessage;
    } else {
      resultSearchMessage = groupMessage
          .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    }
    groupMessageFilter = resultSearchMessage;
  }
  void searchMessagePersonal(String query) {
    List<Message> resultSearchMessage = <Message>[];
    if (query.isEmpty) {
      resultSearchMessage = arguments;
    } else {
      resultSearchMessage = arguments
          .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    }
    messageFilter = resultSearchMessage;
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      color: Color.fromRGBO(246, 246, 246, 1),
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextFormField(
                        autofocus: true,
                        onTap: () {},
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) {
                              hasText = false;
                            } else {
                              hasText = true;
                            }
                          });
                          searchMessagePersonal(text);
                          searchMessageGroup(text);

                        },
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
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
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 6, 16, 0),
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Hủy",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 69, 89, 1),
                            fontSize: 12),
                      )),
                ),
              ],
            ),
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
                          "Cá nhân ",
                          style: TextStyle(
                              color: _selectedPageIndex == 0
                                  ? Color.fromRGBO(248, 129, 37, 1)
                                  : Color.fromRGBO(26, 26, 26, 1),
                              fontSize: 14),
                        ),
                        Visibility(
                          visible: hasText,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: _selectedPageIndex == 0
                                    ? Color.fromRGBO(248, 129, 37, 1)
                                    : Color.fromRGBO(177, 177, 177, 1)),
                            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Text(
                              "${messageFilter.length}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
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
                          "Nhóm  ",
                          style: TextStyle(
                              color: _selectedPageIndex == 1
                                  ? Color.fromRGBO(248, 129, 37, 1)
                                  : Color.fromRGBO(26, 26, 26, 1),
                              fontSize: 14),
                        ),
                        Visibility(
                            visible: hasText,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: _selectedPageIndex == 1
                                      ? Color.fromRGBO(248, 129, 37, 1)
                                      : Color.fromRGBO(177, 177, 177, 1)),
                              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Text(
                                "${groupMessageFilter.length}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ))
                      ],
                    ),
                  ),
                ]),
            Expanded(child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [MyMessagePersonal(context),MyMessageGroup(context)]))
          ],
        ),
      ),
    ));
  }
  Widget MyMessagePersonal(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: hasText == true,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color.fromRGBO(133, 133, 133, 1),
                      ),
                      Visibility(
                          visible: messageFilter.isNotEmpty,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: " Tim thấy ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(133, 133, 133, 1),
                                        fontSize: 14)),
                                TextSpan(
                                    text: "${messageFilter.length} ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(248, 129, 37, 1),
                                        fontSize: 14)),
                                TextSpan(
                                    text: "Tin nhắn ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(133, 133, 133, 1),
                                        fontSize: 14)),
                              ]))),
                      Visibility(
                          visible: messageFilter.isEmpty,
                          child: Text(" Không tìm thấy kết quả nào",
                              style: TextStyle(
                                  color: Color.fromRGBO(133, 133, 133, 1),
                                  fontSize: 14)))
                    ],
                  ),
                ),
              )),
          Visibility(
              visible: hasText == true,
              child: Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messageFilter.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          message = messageFilter[index];
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
                                  backgroundColor:
                                  Color.fromRGBO(248, 129, 37, 1),
                                  foregroundColor: Colors.white,
                                  icon: CustomIcons.more,
                                ),
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (context) => _onClickSlidable(
                                      index, Actions.notification),
                                  backgroundColor:
                                  Color.fromRGBO(248, 129, 37, 1),
                                  foregroundColor: Colors.white,
                                  icon: CustomIcons.notifications,
                                ),
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (context) =>
                                      _onClickSlidable(index, Actions.delete),
                                  backgroundColor:
                                  Color.fromRGBO(248, 129, 37, 1),
                                  foregroundColor: Colors.white,
                                  icon: CustomIcons.delete_conversation,
                                ),
                              ],
                            ),
                            child: Container(
                              margin: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Image.asset(
                                      "${messageFilter[index].avatar}"),
                                  Padding(padding: EdgeInsets.only(left: 16)),
                                  Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "${messageFilter[index].name}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                              Color.fromRGBO(0, 0, 0, 1)),
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "${messageFilter[index].message}",
                                          style: TextStyle(
                                              color: messageFilter[index]
                                                  .status ==
                                                  true
                                                  ? Color.fromRGBO(
                                                  26, 26, 26, 1)
                                                  : Color.fromRGBO(
                                                  133, 133, 133, 1),
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Icon(
                                    Icons.circle,
                                    color: messageFilter[index].status == true
                                        ? Color.fromRGBO(248, 129, 37, 1)
                                        : Colors.white,
                                    size: 18,
                                  )
                                ],
                              ),
                            )),
                      );
                    }),
              )),
          Visibility(
              visible: hasText == false,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text(
                        "Gần đây",
                        style: TextStyle(
                            color: Color.fromRGBO(177, 177, 177, 1),
                            fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                            margin: EdgeInsets.only(right: 24),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Chỉnh sửa",
                                style: TextStyle(
                                    color: Color.fromRGBO(248, 129, 37, 1),
                                    fontSize: 12),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listPersonal.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 16, left: 16),
                              child: Column(
                                children: [
                                  Image.asset("${listPersonal[index].avatar}"),
                                  Padding(padding: EdgeInsets.only(top: 8)),
                                  Text(
                                    "${listPersonal[index].name}",
                                    style: TextStyle(
                                        color:
                                        Color.fromRGBO(26, 26, 26, 1),
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 16),
                      child: Text(
                        "Gợi ý",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(177, 177, 177, 1)),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: listPersonal.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin:
                                  EdgeInsets.only(top: 16, left: 16),
                                  child: Row(
                                    children: [
                                      Image.asset("${listPersonal[index].avatar}"),
                                      Padding(
                                          padding:
                                          EdgeInsets.only(left: 8)),
                                      Text(
                                        "${listPersonal[index].name}",
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
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
  Widget MyMessageGroup(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: hasText == true,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color.fromRGBO(133, 133, 133, 1),
                      ),
                      Visibility(
                          visible: groupMessageFilter.isNotEmpty,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: " Tim thấy ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(133, 133, 133, 1),
                                        fontSize: 14)),
                                TextSpan(
                                    text: "${groupMessageFilter.length} ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(248, 129, 37, 1),
                                        fontSize: 14)),
                                TextSpan(
                                    text: "Tin nhắn ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(133, 133, 133, 1),
                                        fontSize: 14)),
                              ]))),
                      Visibility(
                          visible: groupMessageFilter.isEmpty,
                          child: Text(" Không tìm thấy kết quả nào",
                              style: TextStyle(
                                  color: Color.fromRGBO(133, 133, 133, 1),
                                  fontSize: 14)))
                    ],
                  ),
                ),
              )),
          Visibility(
              visible: hasText == true,
              child: Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: groupMessageFilter.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){

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
                                  backgroundColor:
                                  Color.fromRGBO(248, 129, 37, 1),
                                  foregroundColor: Colors.white,
                                  icon: CustomIcons.more,
                                ),
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (context) => _onClickSlidable(
                                      index, Actions.notification),
                                  backgroundColor:
                                  Color.fromRGBO(248, 129, 37, 1),
                                  foregroundColor: Colors.white,
                                  icon: CustomIcons.notifications,
                                ),
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (context) =>
                                      _onClickSlidable(index, Actions.delete),
                                  backgroundColor:
                                  Color.fromRGBO(248, 129, 37, 1),
                                  foregroundColor: Colors.white,
                                  icon: CustomIcons.delete_conversation,
                                ),
                              ],
                            ),
                            child: Container(
                              margin: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                            "${groupMessageFilter[index].listMessageGroup![index].avatar}"),
                                        Positioned(
                                          right: 20,
                                          child: Image.asset(
                                              "${groupMessageFilter[index].listMessageGroup![index].avatar}"),)
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "${groupMessageFilter[index].name}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                              Color.fromRGBO(0, 0, 0, 1)),
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "${groupMessageFilter[index].listMessageGroup![0].message}",
                                          style: TextStyle(
                                              color: groupMessageFilter[index].listMessageGroup![0]
                                                  .status ==
                                                  true
                                                  ? Color.fromRGBO(
                                                  26, 26, 26, 1)
                                                  : Color.fromRGBO(
                                                  133, 133, 133, 1),
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Icon(
                                    Icons.circle,
                                    color: groupMessageFilter[index].listMessageGroup![0].status == true
                                        ? Color.fromRGBO(248, 129, 37, 1)
                                        : Colors.white,
                                    size: 18,
                                  )
                                ],
                              ),
                            )),
                      );
                    }),
              )),
          Visibility(
              visible: hasText == false,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text(
                        "Gần đây",
                        style: TextStyle(
                            color: Color.fromRGBO(177, 177, 177, 1),
                            fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                            margin: EdgeInsets.only(right: 24),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Chỉnh sửa",
                                style: TextStyle(
                                    color: Color.fromRGBO(248, 129, 37, 1),
                                    fontSize: 12),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listPersonal.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 16, left: 16),
                              child: Column(
                                children: [
                                  Image.asset("${listPersonal[index].avatar}"),
                                  Padding(padding: EdgeInsets.only(top: 8)),
                                  Text(
                                    "${listPersonal[index].name}",
                                    style: TextStyle(
                                        color:
                                        Color.fromRGBO(26, 26, 26, 1),
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 16),
                      child: Text(
                        "Gợi ý",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(177, 177, 177, 1)),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: listPersonal.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin:
                                  EdgeInsets.only(top: 16, left: 16),
                                  child: Row(
                                    children: [
                                      Image.asset("${listPersonal[index].avatar}"),
                                      Padding(
                                          padding:
                                          EdgeInsets.only(left: 8)),
                                      Text(
                                        "${listPersonal[index].name}",
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
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
  void _onClickSlidable(int index, Actions actions) {}

}


