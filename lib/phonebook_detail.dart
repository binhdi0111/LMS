import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dangnhap_lms/models/user.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/student_information.dart';
enum Role{student,teacher,parents}
class MyPhoneBook extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PhoneBook();
  }

}
class PhoneBook extends State<MyPhoneBook>{
  var arguments = Get.arguments;
  List<User> list = <User>[];

  getTitle(role){
    switch(role){
      case Role.parents:
        return "Phụ huynh hs: ";
      case Role.student:
        return "Phụ huynh: ";
      case Role.teacher:
        return "Giáo viên môn: ";
    }
  }
  getLabel(role){
    switch(role){
      case "Học Sinh":
        return "Danh Bạ Học Sinh";
      case "Phụ Huynh":
        return "Danh Bạ Phụ Huynh";
      case "Giáo Viên":
        return "Danh Bạ Giáo Viên";
      case "Tất Cả":
        return "Tất Cả";
    }
  }
  getContent(role){
    switch(role){
      case Role.parents:
        return "Đặng Văn Bình 1";
      case Role.student:
        return "Đặng Văn B";
      case Role.teacher:
        return "Toán";
    }
  }

  getAvartar(role){
    switch(role){
      case Role.parents:
        return "assets/Images/image_avatar_teacher.png";
      case Role.student:
        return "assets/Images/avatar.png";
      case Role.teacher:
        return "assets/Images/avatar_person.png";
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = arguments[0];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(248, 129, 37, 1),
          title: Text(getLabel(arguments[1]),style: TextStyle(color: Colors.white,fontSize: 16)),
        ),
        body: Container(
          child: Column(
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
                                  borderSide: BorderSide(color: Color.fromRGBO(177, 177, 177, 1)),
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              prefixIcon: Icon(Icons.search,color: Color.fromRGBO(177, 177, 177, 1),),
                              hintText: "Tìm kiếm",
                              isCollapsed: true,
                              hintStyle: TextStyle(fontSize: 14,color: Color.fromRGBO(177, 177, 177, 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(248, 129, 37, 1))
                              )
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Color.fromRGBO(248, 129, 37, 1),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Container(
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color.fromRGBO(248, 129, 37, 1),
                      ),
                      child: Icon(Icons.filter_alt,color: Colors.white,),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text("Thông Tin Học Sinh ",style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1),fontSize: 12),),
                    Text("Lớp 12A4",style: TextStyle(color: Color.fromRGBO(248, 129, 37, 1),fontSize: 12),),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Expanded(child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 8,top: 8),
                            child: Image.asset(getAvartar(list[index].role)),
                          ),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 8)),
                              InkWell(
                                onTap: (){
                                  Get.to(Student_information(),arguments: list);
                                  print("listsssssss${list.length}");
                                },
                                child: Text("${list[index].name}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                              ),
                              Padding(padding: EdgeInsets.only(top: 4)),
                              Row(
                                children: [
                                  Text(getTitle(list[index].role),style: TextStyle(fontSize: 14,color: Color.fromRGBO(133, 133, 133, 1)),),
                                  Text(getContent(list[index].role),style: TextStyle(color: Color.fromRGBO(248, 129, 37, 1),fontSize: 14),)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 4)),
                              Row(
                                children: [
                                  Text("Số điện thoại: ",style: TextStyle(fontSize: 14,color: Color.fromRGBO(133, 133, 133, 1)),),
                                  Text("0969804506",style: TextStyle(color: Colors.black,fontSize: 14),)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 8)),
                            ],
                          ),),
                          Container(
                            margin: EdgeInsets.only(right: 16,top: 10),
                            child: SvgPicture.asset("assets/Images/icon_message.svg"),                        )
                        ],
                      ),
                    );
                  }
              )
              )
            ],
          ),
        )
    ));
  }

}