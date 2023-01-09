import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySendInAppNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SendInAppNotification();
  }
}

class SendInAppNotification extends State<MySendInAppNotification> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 129, 37, 1),
        elevation: 0,
        title: Text(
          "Gửi Thông Báo Trên Ứng Dụng",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Padding(padding: EdgeInsets.only(right: 16))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Danh  Lớp Sách Nhận",
              style: TextStyle(
                  color: Color.fromRGBO(177, 177, 177, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            Get.to(MyDetailSendInAppNotification());
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          height: 56,
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Text(
                                    "Lớp 12A4",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(26, 26, 26, 1),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8)),
                                  Visibility(
                                      visible: index == 0,
                                      child: Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(248, 129, 37, 1),
                                      )),
                                  Expanded(child: Container()),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromRGBO(248, 129, 37, 1),
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    ));
  }
}

class MyDetailSendInAppNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailSendInAppNotification();
  }
}

class DetailSendInAppNotification extends State<MyDetailSendInAppNotification> {
  String? _dropDownSort;
  List<String>? _dropDownDetailSort;
  List<String> listSort = ["A", "Z"];
  List<String> listSort1 = ["Z", "A"];
  List<bool> click = [];
  int indexClick = 0;
  List<bool> clickAll = [];
  int selectedQuantity = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 4; i++) {
      click.add(false);
    }
    click[indexClick] = true;
  }

  showColor(index) {
    for (int i = 0; i < 4; i++) {
      click.add(false);
    }
    click[index] = true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 129, 37, 1),
        elevation: 0,
        title: Text(
          "Gửi Thông Báo Trên Ứng Dụng",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Padding(padding: EdgeInsets.only(right: 16))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(177, 177, 177, 1)),
                              borderRadius: BorderRadius.circular(6)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(177, 177, 177, 1),
                          ),
                          hintText: "Tìm kiếm",
                          isCollapsed: true,
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(177, 177, 177, 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(248, 129, 37, 1)))),
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Color.fromRGBO(248, 129, 37, 1),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                InkWell(
                  onTap: () {
                   showDialogFilter();
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(248, 129, 37, 1),
                    ),
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 8)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      indexClick = 0;
                      showColor(indexClick);
                    });
                  },
                  child: Text(
                    "Tất Cả",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: indexClick == 0
                            ? Color.fromRGBO(248, 129, 37, 1)
                            : Color.fromRGBO(177, 177, 177, 1)),
                  )),
              Padding(padding: EdgeInsets.only(right: 16)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      indexClick = 1;
                      showColor(indexClick);
                    });
                  },
                  child: Text(
                    "Học Sinh",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: indexClick == 1
                            ? Color.fromRGBO(248, 129, 37, 1)
                            : Color.fromRGBO(177, 177, 177, 1)),
                  )),
              Padding(padding: EdgeInsets.only(right: 16)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      indexClick = 2;
                      showColor(indexClick);
                    });
                  },
                  child: Text(
                    "Phụ Huynh",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: indexClick == 2
                            ? Color.fromRGBO(248, 129, 37, 1)
                            : Color.fromRGBO(177, 177, 177, 1)),
                  )),
              Padding(padding: EdgeInsets.only(right: 16)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      indexClick = 3;
                      showColor(indexClick);
                    });
                  },
                  child: Text(
                    "Giáo Viên",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: indexClick == 3
                            ? Color.fromRGBO(248, 129, 37, 1)
                            : Color.fromRGBO(177, 177, 177, 1)),
                  ))
            ],
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: Radio(
                        value: false,
                        groupValue: clickAll,
                        onChanged: (value) {
                          setState(() {
                            value = true;
                          });
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Text(
                      "Chọn hết",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Expanded(child: Container()),
                    Text(
                      "Đã chọn $selectedQuantity /20",
                      style: TextStyle(
                          color: Color.fromRGBO(177, 177, 177, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: SizedBox(
              height: 46,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(248, 129, 37, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                child: Text("Tiếp Tục",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          )
        ],
      ),
    ));
  }

  void showDialogFilter() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Material(
              color: Colors.transparent,
              child: StatefulBuilder(builder: (context, setState) {
               return GestureDetector(
                  onTap: () {},
                  child: Wrap(
                    children: [
                      Container(
                        margin:
                        EdgeInsets.fromLTRB(150, 120, 16, 0),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Lọc",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.black,
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 8)),
                            const Divider(),
                            const Padding(
                                padding: EdgeInsets.only(top: 8)),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.fromLTRB(
                                      8, 4, 8, 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              192, 192, 192, 1)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          4)),
                                  child:
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      iconSize: 0,
                                      icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                                      elevation: 0,
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                      hint: _dropDownSort == null
                                          ? Row(
                                        children: const [
                                          Text(
                                            'Sắp xếp theo  ',
                                            style: TextStyle(
                                                fontSize:
                                                14,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                color: Colors
                                                    .black),
                                          ),
                                          Icon(
                                            Icons
                                                .keyboard_arrow_down,
                                            color: Colors
                                                .black,
                                            size: 18,
                                          )
                                        ],
                                      )
                                          : Text(
                                        "${_dropDownSort}",
                                        style: TextStyle(
                                            color: Colors
                                                .black),
                                      ),
                                      items: [
                                        'Theo vần chữ cái',
                                        'Ngẫu nhiên'
                                      ].map(
                                            (value) {
                                          return DropdownMenuItem<
                                              String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  color: Colors
                                                      .black),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) {
                                        setState(
                                              () {
                                            _dropDownSort =
                                            value!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.fromLTRB(
                                      8, 4, 8, 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              192, 192, 192, 1)),
                                      borderRadius:
                                      BorderRadius.circular(
                                          4)),
                                  child:
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      iconSize: 0,
                                      elevation: 0,
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                      items: [listSort, listSort1]
                                          .map(
                                            (list) {
                                          return DropdownMenuItem<
                                              List<String>>(
                                            value: list,
                                            child: Row(
                                              children: [
                                                Text("${list[0]}",
                                                    style: TextStyle(
                                                        fontSize:
                                                        14,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        color: Colors
                                                            .black)),
                                                Padding(
                                                    padding: EdgeInsets
                                                        .only(
                                                        right:
                                                        4)),
                                                Icon(
                                                  Icons
                                                      .arrow_forward,
                                                  color: Color
                                                      .fromRGBO(
                                                      248,
                                                      129,
                                                      37,
                                                      1),
                                                  size: 14,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets
                                                        .only(
                                                        left:
                                                        4)),
                                                Text("${list[1]}",
                                                    style: TextStyle(
                                                        fontSize:
                                                        14,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        color: Colors
                                                            .black)),
                                                Padding(
                                                    padding: EdgeInsets
                                                        .only(
                                                        right:
                                                        8))
                                              ],
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) {
                                        setState(
                                              () {
                                            _dropDownDetailSort =
                                                value;
                                            print(
                                                _dropDownDetailSort);
                                          },
                                        );
                                      },
                                      hint:
                                      _dropDownDetailSort ==
                                          null
                                          ? Row(
                                        children: [
                                          Row(
                                            children: const [
                                              Text("A",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black)),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(right: 4)),
                                              Icon(
                                                Icons
                                                    .arrow_forward,
                                                color: Color.fromRGBO(
                                                    248,
                                                    129,
                                                    37,
                                                    1),
                                                size:
                                                14,
                                              ),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(left: 4)),
                                              Text("Z",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black)),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(right: 8))
                                            ],
                                          ),
                                          Icon(
                                              Icons
                                                  .keyboard_arrow_down,
                                              color: Colors
                                                  .black,
                                              size: 18)
                                        ],
                                      )
                                          : Row(
                                        children: [
                                          Text(
                                              "${_dropDownDetailSort![0]}",
                                              style: const TextStyle(
                                                  fontSize:
                                                  14,
                                                  fontWeight: FontWeight
                                                      .w400,
                                                  color:
                                                  Colors.black)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  right:
                                                  4)),
                                          Icon(
                                            Icons
                                                .arrow_forward,
                                            color: Color
                                                .fromRGBO(
                                                248,
                                                129,
                                                37,
                                                1),
                                            size: 14,
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                  4)),
                                          Text(
                                              "${_dropDownDetailSort![1]}",
                                              style: const TextStyle(
                                                  fontSize:
                                                  14,
                                                  fontWeight: FontWeight
                                                      .w400,
                                                  color:
                                                  Colors.black)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  right:
                                                  8))
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 8)),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Làm Mới",
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          26, 59, 112, 1),
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },),
            ),
          );
        });
  }
}
