import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/phonebook_detail.dart';
import 'package:dangnhap_lms/models/user.dart';

class MyPhoneBookPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PhoneBookPage();
  }

}

class PhoneBookPage extends State<MyPhoneBookPage>{
  bool isExpandStudent = false;
  int?  indexItemStudent;
  bool isExpandParents = false;
  int?  indexItemParents;
  List<User> listUserAll = <User>[
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
  ];
  List<User> listUserStudent = <User>[
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.student),
  ];
  List<User> listUserTeacher = <User>[
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.teacher),
  ];
  List<User> listUserParent = <User>[
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
    User(name: "Đặng Văn Bình",phone: 0969804506,role: Role.parents),
  ];


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:  Color.fromRGBO(248, 129, 37, 1),
            title: Text("Danh Bạ",style: TextStyle(color: Colors.white,fontSize: 16),),
            actions: [
              Icon(Icons.home,color: Colors.white,),
              Padding(padding: EdgeInsets.only(right: 16))
            ],
              automaticallyImplyLeading: false,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 16,right: 16,top: 24),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpandStudent = !isExpandStudent;
                      });
                    },
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child:  Row(
                          children: [
                            Text("Học sinh",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.bold),),
                            Expanded(child: Container()),
                            Visibility(
                              visible: isExpandStudent == false,
                              child: Icon(Icons.arrow_forward_ios,color:  Color.fromRGBO(248, 129, 37, 1),size: 18,),),
                            Visibility(
                              visible: isExpandStudent == true,
                              child: Icon(Icons.keyboard_arrow_up,color:  Color.fromRGBO(248, 129, 37, 1)),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6,left: 6),
                    child: Visibility(
                        visible: isExpandStudent == true,
                        child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    indexItemStudent = index;
                                    Get.to(MyPhoneBook(),arguments: [listUserStudent,"Học Sinh"]);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: index == indexItemStudent?Color.fromRGBO(249, 154, 81, 1):Colors.white,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  margin: EdgeInsets.only(top: 8,bottom: 8),
                                  padding: EdgeInsets.only(left: 21,top: 13,bottom: 13),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/Images/icon_class.svg",color: index == indexItemStudent?Colors.white:Color.fromRGBO(90, 90, 90, 1),),
                                      Padding(padding: EdgeInsets.only(left: 8)),
                                      Text("Lớp 12A${index+1}",style: TextStyle(fontSize: 14,color: index == indexItemStudent?Colors.white:Color.fromRGBO(90, 90, 90, 1)),),
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpandParents = !isExpandParents;
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text("Phụ Huynh Học Sinh",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.bold),),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,color:  Color.fromRGBO(248, 129, 37, 1),size: 18,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6,left: 6),
                    child: Visibility(
                        visible: isExpandParents == true,
                        child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    indexItemParents = index;
                                    Get.to(MyPhoneBook(),arguments: [listUserParent,"Phụ Huynh"]);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: index == indexItemParents?Color.fromRGBO(249, 154, 81, 1):Colors.white,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  margin: EdgeInsets.only(top: 8,bottom: 8),
                                  padding: EdgeInsets.only(left: 21,top: 13,bottom: 13),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/Images/icon_class.svg",color: index == indexItemParents?Colors.white:Color.fromRGBO(90, 90, 90, 1),),
                                      Padding(padding: EdgeInsets.only(left: 8)),
                                      Text("Lớp 12A${index+1}",style: TextStyle(fontSize: 14,color: index == indexItemParents?Colors.white:Color.fromRGBO(90, 90, 90, 1)),),
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),

                  Padding(padding: EdgeInsets.only(top: 16)),
                  InkWell(
                    onTap: () {
                      Get.to(MyPhoneBook(),arguments: [listUserTeacher,"Giáo Viên"]);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text("Giáo viên",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.bold),),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,color:  Color.fromRGBO(248, 129, 37, 1),size: 18,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  InkWell(
                    onTap: () {
                      Get.to(MyPhoneBook(),arguments: [listUserAll,"Tất Cả"]);
                      print(listUserAll.length);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text("Tất cả",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.bold),),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,color:  Color.fromRGBO(248, 129, 37, 1),size: 18,),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

}