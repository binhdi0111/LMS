import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/models/message.dart';
import 'package:intl/intl.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyMessageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageContent();
  }
}

class MessageContent extends State<MyMessageContent> {
  Message argument = Get.arguments;
  List<Message> _listMessage = <Message>[];
  var _textEditingController = TextEditingController();
  bool isShowSticker = false;
  bool hasFocus = false;
  final _imgPicker = ImagePicker();
  File ? imageSelect;
  FocusNode focusNode = FocusNode();
  bool _showCursor = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listMessage.add(
      Message(
          avatar: "${argument.avatar}",
          name: "${argument.name}",
          status: false,
          message:
              "Alex, let’s meet this weekend. I’ll check with Dave too 😎"),
    );
    _listMessage.add(
      Message(
          avatar: "${argument.avatar}",
          name: "${argument.name}",
          status: true,
          message: "Sure. Let’s aim for saturday"),
    );
    _listMessage.add(
      Message(
          avatar: "${argument.avatar}",
          name: "${argument.name}",
          status: true,
          message: "I’m visiting mom this sunday 👻"),
    );
    _listMessage.add(
      Message(
          avatar: "${argument.avatar}",
          name: "${argument.name}",
          status: false,
          message: "Alrighty! Will give you a call shortly 🤗"),
    );
    _listMessage.add(
      Message(
          avatar: "${argument.avatar}",
          name: "${argument.name}",
          status: true,
          message: "❤"),
    );
    _listMessage.add(
      Message(
          avatar: "${argument.avatar}",
          name: "${argument.name}",
          status: false,
          message: "Hey you! Are you there?"),
    );
    _listMessage.add(
      Message(
          avatar: "${argument.avatar}",
          name: "${argument.name}",
          status: true,
          message: "👋 Hi Jess! What’s up?"),
    );
    print("kkkkkkkkkkkkk${_listMessage[0].message}");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              margin: EdgeInsets.all(6),
              child: Row(
                children: [
                  BackButton(),
                  CircleAvatar(
                    backgroundImage: AssetImage("${argument.avatar}"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 8)),
                  Text(
                    "${argument.name}",
                    style: TextStyle(
                        color: Color.fromRGBO(26, 26, 26, 1), fontSize: 14),
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.more_horiz),
                  Padding(padding: EdgeInsets.only(right: 16)),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          Text(DateFormat(' hh:mm, d MMM').format(DateTime.now())),
          Expanded(
            child: Container(
                child: ListView.builder(
                    itemCount: _listMessage.length,
                    itemBuilder: (context, index) {
                      return _listMessage[index].status!
                          ? Container(
                              child: Wrap(
                                children: [
                                  Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(12)),
                                          color:
                                              Color.fromRGBO(248, 129, 37, 1),
                                        ),
                                        margin:
                                            EdgeInsets.only(top: 16, right: 16),
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "${_listMessage[index].message}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 4)),
                                      Row(
                                        children: [
                                          Expanded(child: Container()),
                                          Text(
                                            DateFormat.jm()
                                                .format(DateTime.now()),
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    192, 192, 192, 1),
                                                fontSize: 10),
                                          ),
                                          Visibility(
                                            visible: false,
                                            child: Icon(
                                              Icons.check_circle_outline,
                                              size: 14,
                                            ),
                                          ),
                                          Visibility(
                                            visible: false,
                                            child: Icon(
                                              Icons.circle_outlined,
                                              size: 14,
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, right: 16))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  top: 16, left: 16, bottom: 16),
                              child: Wrap(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "${_listMessage[index].avatar}"),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(12)),
                                          color:
                                              Color.fromRGBO(246, 246, 246, 1),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "${_listMessage[index].message}",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(26, 26, 26, 1),
                                              fontSize: 12),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 4)),
                                      Text(
                                        DateFormat.jm().format(DateTime.now()),
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                192, 192, 192, 1),
                                            fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                    })),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Color.fromRGBO(246, 246, 246, 1),
            ),
            child: FocusScope(
              node: FocusScopeNode(),
              onFocusChange: (focus) {
                //Called when ever focus changes
                print("focus hihihihihii: $focus");
                setState(() {
                  hasFocus = focus;
                  if(hasFocus == true){
                    isShowSticker = false;
                  }
                });
              },
              child: Focus(
                child: TextFormField(
                  onTap: (){
                    setState(() {
                      isShowSticker = false;
                      _showCursor = true;
                    });
                  },
                  showCursor: _showCursor,
                  focusNode: focusNode,
                  textAlignVertical: TextAlignVertical.center,
                  controller: _textEditingController,
                  onFieldSubmitted: (value) {
                    setState(() {
                      _listMessage.add(Message(
                          message: "$value",
                          status: true,
                          name: "hihihi",
                          avatar: "hihihii"));
                      _textEditingController.clear();
                      isShowSticker = false;
                    });
                  },
                  cursorColor: Color.fromRGBO(248, 129, 37, 1),
                  decoration: InputDecoration(
                      hintText: "Type your message here...",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(177, 177, 177, 1), fontSize: 12),
                      border: InputBorder.none,
                      suffixIcon: Container(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Pick_image_to_library();
                                });
                              },
                              child: Image.asset("assets/Images/icon_image_message.png"),
                            ),
                            Padding(padding: EdgeInsets.only(left: 8)),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isShowSticker = !isShowSticker;
                                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                                  _showCursor = false;
                                });
                              },
                              child: Image.asset(
                                  "assets/Images/icon_emoji_message.png"),
                            ),
                            Padding(padding: EdgeInsets.only(right: 8)),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
          Offstage(
            offstage: !isShowSticker,
            child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  textEditingController: _textEditingController,
                  config: Config(
                    columns: 7,
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    emojiSizeMax: 32 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
                            ? 1.30
                            : 1.0),
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: const Color(0xFFF2F2F2),
                    indicatorColor: Color.fromRGBO(248, 129, 37, 1),
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    showRecentsTab: true,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: const Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    loadingIndicator: const SizedBox.shrink(),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                    checkPlatformCompatibility: true,
                  ),
                )),
          ),
        ],
      ),
    ));
  }
  void Pick_image_to_library() async{
    final XFile ? img = await _imgPicker.pickImage(source: ImageSource.gallery);
    if(img != null){
      setState(() {
        imageSelect = File(img.path);
      });

    }

  }
}
