import 'package:flutter/material.dart';
import 'models/detail_item.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/student_information.dart';

class TeachingCalendar extends StatelessWidget{
  List<Detail_item_listStudent> _listStudent =[
    Detail_item_listStudent(id: 1, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 2, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 3, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 4, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 5, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 6, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 7, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 8, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 9, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 10, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 11, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 12, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 13, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 14, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 15, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
    Detail_item_listStudent(id: 16, nameStudent: "Chú cá", dateOfBirth: '01/11/2000'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 129, 37, 1),
        elevation: 0,
        title: Text("Lịch dạy",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Môn Toán",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color.fromRGBO(133, 133, 133, 1)),),
              Padding(padding: EdgeInsets.only(top: 8)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Môn học",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w400),),
                        Expanded(child: Container()),
                        Text("Toán",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w500))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                    Row(
                      children: [
                        Text("Lớp",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w400),),
                        Expanded(child: Container()),
                        Text("12A2",style: TextStyle(fontSize: 14,color: Color.fromRGBO(248, 129, 37, 1),fontWeight: FontWeight.w500))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                    Row(
                      children: [
                        Text("Thời gian",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w400),),
                        Expanded(child: Container()),
                        Text("7h00-8h45",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w500))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                    Row(
                      children: [
                        Text("Ngày",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w400),),
                        Expanded(child: Container()),
                        Text("01/11/2000",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w500))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Row(
                children: [
                  Text("Danh Sách Học Sinh Lớp ",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w400),),
                  Text("12A2",style: TextStyle(fontSize: 14,color: Color.fromRGBO(248, 129, 37, 1),fontWeight: FontWeight.w500))
                ],
              ),
              Container(
                  child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _listStudent.length,
                  itemBuilder:(context, index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(Student_information());
                      },
                      child:    Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin:EdgeInsets.only(left: 16, right: 24),
                                child:Text('${_listStudent[index].id}', style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1),fontSize: 14),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  children: [
                                    Image.asset('assets/Images/avatar_person.png',width: 48, height: 48,),
                                    Padding(padding: EdgeInsets.only(right: 4)),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 200,
                                            child:
                                            RichText(text: TextSpan(
                                                children: [
                                                  TextSpan(text: 'Học Sinh: ',style:  TextStyle(color: Color.fromRGBO(248, 129, 37, 1),fontSize: 14)),
                                                  TextSpan(text: '${_listStudent[index].nameStudent}' ,style:  TextStyle(color: Color.fromRGBO(26, 26, 26, 1),fontSize: 14)),
                                                ]
                                            )),
                                          ),
                                          Padding(padding: EdgeInsets.only(top: 4)),
                                          Container(
                                            width: 200,
                                            child:
                                            Text('${_listStudent[index].dateOfBirth}',style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1), fontSize: 14),),)

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider()
                        ],
                      ),
                    );

                  }))
            ],
          ),
        ),
      ),
    ));
  }

}