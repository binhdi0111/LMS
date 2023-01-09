import 'package:dangnhap_lms/student_information.dart';
import 'package:flutter/material.dart';
import 'models/detail_item.dart';
import 'package:get/get.dart';

class Student_list extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Detail_Student_list();
  }

}
class Detail_Student_list extends State<Student_list>{

   List<Detail_item_listStudent> _listStudent =[];

   @override
  void initState() {
  for(int i=1; i<= 15;i++){
    _listStudent.add(Detail_item_listStudent(id: i, nameStudent: "Minh Nhật", dateOfBirth: '28/10/2003'));
  }
  }
  ListView _listViewStudent(){
     return ListView.builder(
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

         });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor:Color.fromRGBO(249, 249, 249, 1) ,
     appBar: AppBar(
       actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home),color: Colors.white,)],
       backgroundColor: Color.fromRGBO(248, 129, 37, 1),
       title: Text('Danh Sách Học Sinh', style:  TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'static/Inter-Medium.ttf' ),),
     ),
     body: Center(
       child:Column(
         children: [
           Container(
             alignment: Alignment.centerLeft,
             margin: EdgeInsets.only(top: 16, left: 16, bottom: 8),
             child: 
           RichText(
             text: TextSpan(
               children: [
                 TextSpan(text: 'Danh Sách Học Sinh ', style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1),fontSize: 12)),
                 TextSpan(text: 'Lớp 12A4', style:  TextStyle(color: Color.fromRGBO(248, 129, 37, 1),fontSize: 12))
               ]
               
             ),
           )),

         Expanded(child:
         Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(6),
               color: Color.fromRGBO(239, 239, 239, 1)
           ),
           margin: EdgeInsets.only(left: 16, right:  16),
           child: SingleChildScrollView(
             physics: ScrollPhysics(),
             child: this._listViewStudent(),
           ),
         )
         )

         ],
       ) ,
     ),
   );
  }

}