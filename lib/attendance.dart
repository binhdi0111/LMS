
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/detail_item.dart';
import 'package:dangnhap_lms/detail_attendance.dart';

class Attendance extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Detail_attendance_page();
  }
}
enum status {
  onTime,
  lateTime,
  notAllowed
}
class Detail_attendance_page extends State<Attendance>{
  bool isvisibility = false;
  bool text_color= false;
String ontime ="Đúng giờ";
String latetime ="Đi muộn";
String noAllowwed ="Không phép";

  List<Detail_item_attendance> _attendance =[
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}', Status: status.onTime),
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}', Status: status.onTime),
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}', Status: status.lateTime),
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}', Status: status.lateTime),
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}', Status: status.onTime),
  ];

  List<Detail_item_attendance> _attendance_notAllowed =[
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}', Status: status.notAllowed),
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}'),
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}'),
    Detail_item_attendance(Date: '${DateFormat.yMd().format(DateTime.now())}'),
  ];





  getColorStatus(state){
    switch(state){
      case status.onTime:
        return Color.fromRGBO(221, 246, 235, 1);
      case status.lateTime:
        return Color.fromRGBO(255, 239, 203, 1);
      case status.notAllowed:
        return Color.fromRGBO(255,200,206,1);
        default:
          return Color.fromRGBO(255, 255, 255, 1);
    }

  }



  getColorTextStatus(state){
    switch(state){
      case status.onTime:
        return Color.fromRGBO(77,197,145, 1);
      case status.lateTime:
        return Color.fromRGBO(253,185,36, 1);
      case status.notAllowed:
        return Color.fromRGBO(255,69,89,1);
      default:
        return Color.fromRGBO(255,255,255,1);
    }
  }


  getTextStatus(state){
    switch(state){
      case status.onTime:
        return ontime;
      case status.lateTime:
        return latetime;
      case status.notAllowed:
        return noAllowwed;
      default:
        return Text('');
    }
  }
  ListView _list_attendance(){
    return ListView.builder(
      shrinkWrap: true,
        itemCount: _attendance.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Get.to(Detail_attendance());
            },
            child:   Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text('${_attendance[index].Date}', style:  TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 12),),
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    height: 18,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: getColorStatus(_attendance[index].Status),
                    ),
                    child: Text('${getTextStatus(_attendance[index].Status)}', style: TextStyle(color: getColorTextStatus(_attendance[index].Status), fontSize: 10)),)

                ],
              ),
            ),
          );
    });

  }

  ListView _list_attendance_notAllowed(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _attendance_notAllowed.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Get.to(Detail_attendance());
            },
            child:   Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text('${_attendance_notAllowed[index].Date}', style:  TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 12),),
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    height: 18,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: getColorStatus(_attendance_notAllowed[index].Status),
                    ),
                    child: Text('${getTextStatus(_attendance_notAllowed[index].Status)}', style: TextStyle(color: getColorTextStatus(_attendance_notAllowed[index].Status), fontSize: 10)),)

                ],
              ),
            ),
          );
        });

  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor:Color.fromRGBO(245, 245, 245,1) ,
     appBar: AppBar(
       backgroundColor: Color.fromRGBO(248, 129, 37, 1),
       title: Text('Chuyên Cần', style:  TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'static/Inter-Medium.ttf' ),),
     ),
     body: Center(
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             padding: EdgeInsets.all(16),
             color: Color.fromRGBO(255, 255, 255, 1),
             height: 65,
             child:Row(
               children: [
               Row(
                 children: [
                 Image.asset('assets/Images/Avatar_teacher.png'),
                 
                 Container(
                   margin: EdgeInsets.only(left:8 ),
                   child: Column(
                     children: [
                       Container(
                         width: 200,
                         child: Text('Lê Minh Quyền',style: TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12),),
                       ),
                       Container(
                         margin: EdgeInsets.only(top: 2),
                         width: 200,
                         child: Text('Điểm Danh: THPT Cầu Giấy',style: TextStyle(color:Color.fromRGBO(177, 177, 177, 1), fontSize: 12),),
                       )

                     ],
                   ),
                 )  
                 ],
               ),
                 Expanded(child: Container()),
                 Container(
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(6),
                       color: Color.fromRGBO(254, 230, 211, 1)
                   ),
                   width: 90,
                   height: 18,
                   child: Text(DateFormat.yMd().format(DateTime.now()), style: TextStyle(color:Color.fromRGBO(248, 129, 37, 1), fontSize: 12, fontFamily:'static/Inter-Medium.ttf' ),),
                 )
               ],
             ),
           ),
           Container(
             margin: EdgeInsets.only(top: 16, bottom: 8, right: 16, left: 16),
             child: Row(
               children: [
                 Text('Thống Kê', style:  TextStyle(color: Color.fromRGBO(26, 26, 26, 1), fontSize: 12),),
                 Expanded(child: Container()),
                 Text('Tháng 10 năm 2022', style:  TextStyle(color: Color.fromRGBO(177, 177, 177, 1), fontSize: 12),),
               ],
             ),),
           Container(
             margin: EdgeInsets.only(left: 16, right: 16),
             padding: EdgeInsets.only(top: 11, bottom: 11, right:16, left: 16 ),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(6),
                 color: Color.fromRGBO(255, 255, 255, 1)
             ),
             child: Column(
               children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Ngày lên lớp:', style:  text_color ?  TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12 ) : TextStyle(color:Color.fromRGBO(133, 133, 133, 1), fontSize: 12 ) ,),
                          Expanded(child: Container()),
                          Container(
                            child: Row(
                              children: [
                                Text('15 ngày', style:  TextStyle(color:Color.fromRGBO(133, 133, 133, 1), fontSize:  14 ),),
                                Padding(padding: EdgeInsets.only(right: 9)),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      isvisibility =! isvisibility;
                                      text_color =! text_color;
                                    });
                                  },
                                  child: Image.asset('assets/Images/Drop_down_icon.png', width: 24),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    Visibility(
                      visible: isvisibility,
                        child:
                          Container(
                              margin: EdgeInsets.only(top: 11),
                              child: SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: this._list_attendance(),
                        )
                    ))
                    ],
                  ),
                ),

                 Padding(padding: EdgeInsets.only(top: 22)),

             Container(
               child: Column(
                 children: [
                   Row(
                     children: [
                       Text('Ngày vắng:', style: text_color?  TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12 ) : TextStyle(color:  Color.fromRGBO(133, 133, 133, 1), fontSize: 12 ),),
                       Expanded(child: Container()),
                       Container(
                         child: Row(
                           children: [
                             Text('1 ngày', style:  TextStyle(color:Color.fromRGBO(133, 133, 133, 1), fontSize:  14 ),),
                             Padding(padding: EdgeInsets.only(right: 9)),
                             InkWell(
                               onTap: (){
                                 isvisibility =! isvisibility;
                               },
                               child: Image.asset('assets/Images/Drop_down_icon.png',width: 24),
                             )
                           ],
                         ),
                       )
                     ],
                   ),
                  Visibility(
                      visible: isvisibility,
                      child:
                  Container(
                      margin: EdgeInsets.only(top: 11),
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: this._list_attendance_notAllowed(),
                      )
                  )
                  )
                 ],
               ),
             )
               ],
             ),
           ),
           Expanded(child: Container()),
           Container(
             color: Color.fromRGBO(255, 255, 255, 1),
             height: 78,
             padding: EdgeInsets.all(16),
             child: Row(
               children: [
                SizedBox(
                  width: 180,
                  height: 46,
                  child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(248, 129, 37, 1)
                          ),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1)
                      ),
                      onPressed: (){},
                      child: Text('Thống Kê', style: TextStyle(color: Color.fromRGBO(248, 129, 37, 1), fontSize: 16),)),
                ),
                 Expanded(child: Container()),
                 SizedBox(
                   width: 180,
                   height: 46,
                   child:  ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color.fromRGBO(248, 129, 37, 1),
                       ),
                       onPressed: (){},
                       child: Text('Về Trang Chủ', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16),)),
                 )

               ],
             ),
           )
         ],
       ),
     ),


   );
  }

}