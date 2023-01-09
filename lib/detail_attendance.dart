import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Detail_attendance extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return is_Detail_attendance();
  }

}
class is_Detail_attendance extends State<Detail_attendance>{
  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor:Color.fromRGBO(245, 245, 245,1) ,
     appBar: AppBar(
       backgroundColor: Color.fromRGBO(248, 129, 37, 1),
       title: Text('Chuyên Cần', style:  TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'static/Inter-Medium.ttf' ),),
     ),
     body: Center(
       child:
     Column(
       children: [
         Container(
           alignment: Alignment.centerLeft,
           margin: EdgeInsets.only(top: 16, left: 16, bottom: 8),
           child:
           Text('Chi Tiết',textAlign: TextAlign.left,style: TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12 ),),
         ),
         Container(
           margin: EdgeInsets.only(left: 16, right: 16),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(6),
             color: Color.fromRGBO(255, 255, 255, 1)
           ),
           child:Column(
             children: [
             Container(
               margin: EdgeInsets.only(top: 16, right: 16, left: 16),
               child:  Row(
                 children: [
                   Image.asset('assets/Images/Avatar_teacher.png'),
                   Padding(padding: EdgeInsets.only(left: 8)),
                   Text('Lê Minh Quyền', style:  TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12 ),),
                   Expanded(child: Container()),
                   Text(DateFormat.yMd().format(DateTime.now()), style: TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12 ),)
                 ],
               ),
             ),
               Container(
                 margin: EdgeInsets.only(top: 20),
                 height: 274,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(6)
                 ),
                 child: TableCalendar(
                   firstDay: DateTime(2000), focusedDay: focusedDay, lastDay: DateTime(2030),
                   headerVisible: false,
                   shouldFillViewport: true,
                   calendarFormat: format,
                   onFormatChanged: (CalendarFormat _format){
                     setState(() {
                       format = _format;
                     });
                   },
                   startingDayOfWeek: StartingDayOfWeek.monday,
                   onDaySelected: (DateTime selectDay, DateTime focusDay){
                     setState(() {
                       selectedDay = selectDay;
                       focusedDay = focusDay;
                     });
                   },
                   selectedDayPredicate: (DateTime date){
                     return isSameDay(selectedDay, date);
                   },
                   calendarStyle: CalendarStyle(
                     isTodayHighlighted: true,
                     selectedDecoration: BoxDecoration(
                         color: Color.fromRGBO(248, 129, 37, 1),
                         shape: BoxShape.circle
                     ),
                     selectedTextStyle: TextStyle(
                         color: Color.fromRGBO(26, 26, 26, 1),
                         fontSize: 14
                     ),
                     todayDecoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(color: Color.fromRGBO(248, 129, 37, 1)))),
                     todayTextStyle: TextStyle(
                         color: Color.fromRGBO(26, 26, 26, 1),
                         fontSize: 14
                     ),
                   ),
                 ),
               ),

             ],
           ),
         ),

         Container(
           margin: EdgeInsets.only(top: 16, right: 16, left: 16),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(6),
             color: Color.fromRGBO(255, 255, 255, 1)
           ),
           child:
             Column(
               children: [
              Container(
                margin: EdgeInsets.only(left: 18, right: 35, top: 8),
                child:
                TimelineTile(
                  beforeLineStyle: LineStyle(thickness: 1),
                  alignment: TimelineAlign.start,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    padding: EdgeInsets.only(bottom: 8),
                      width: 16,
                      iconStyle: IconStyle(
                          color: Colors.white,
                          iconData: Icons.add
                      )
                  ),
                  endChild:
                  Container(
                    margin: EdgeInsets.only(left: 8),
                      alignment: Alignment.centerLeft,
                      child:
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Điểm danh lúc ${DateFormat('hh: MM').format(DateTime.now())}', style: TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12 ),),
                              Expanded(child: Container())
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 4)),
                          Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child:
                                Icon(Icons.location_on, color:Color.fromRGBO(177, 177, 177, 1) ,size: 12,),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child:
                                Text('Trường THPT Cầu Giấy, Số 12, ngõ 118 Nguyễn Khánh Toàn, QuanHoa, Cầu Giấy, Hà Nội, Việt Nam', style:  TextStyle(color: Color.fromRGBO(177, 177, 177, 1), fontSize: 10),),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 4)),

                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 18,
                                padding: EdgeInsets.only(left: 12, right: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color.fromRGBO(221, 246, 235, 1),
                                ),
                                child: Text('Đúng giờ', style:  TextStyle(color: Color.fromRGBO(77,197,145, 1), fontSize: 10),),),
                              Expanded(child: Container())
                            ],
                          )
                        ],
                      )
                  ),
                ),
              ),

                 Container(
                   height: 20,
                   margin: EdgeInsets.only(left: 25.5, right: 35 ),
                   child:
                 TimelineTile(

                   beforeLineStyle: LineStyle(thickness: 1),
                   alignment: TimelineAlign.start,
                   hasIndicator: false,
                   endChild: Container(
                     color: Colors.white,
                     width: double.infinity,
                     child: Text(''),
                   ),
                 ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 25,left: 18, right: 35 ),
                   child:
                   TimelineTile(
                     beforeLineStyle: LineStyle(thickness: 1),
                     alignment: TimelineAlign.start,
                     isLast: true,
                     indicatorStyle: IndicatorStyle(
                       padding: EdgeInsets.only(top: 8),
                         width: 16,
                         iconStyle: IconStyle(
                             color: Colors.white,
                             iconData: Icons.add
                         )
                     ),
                     endChild:
                     Container(
                         margin: EdgeInsets.only(left: 8),
                         alignment: Alignment.centerLeft,
                         child:
                         Column(
                           children: [
                             Row(
                               children: [
                                 Text('Ra về lúc ${DateFormat('hh: MM').format(DateTime.now())}', style: TextStyle(color:Color.fromRGBO(26, 26, 26, 1), fontSize: 12 ),),
                                 Expanded(child: Container())
                               ],
                             ),
                             Padding(padding: EdgeInsets.only(top: 4)),
                             Stack(
                               children: [
                                 Positioned(
                                   top: 0,
                                   left: 0,
                                   child:
                                   Icon(Icons.location_on, color:Color.fromRGBO(177, 177, 177, 1) ,size: 12,),
                                 ),

                                 Container(
                                   margin: EdgeInsets.only(left: 10),
                                   child:
                                   Text('Trường THPT Cầu Giấy, Số 12, ngõ 118 Nguyễn Khánh Toàn, QuanHoa, Cầu Giấy, Hà Nội, Việt Nam ', style:  TextStyle(color: Color.fromRGBO(177, 177, 177, 1), fontSize: 11),),
                                 )
                               ],
                             ),
                             Padding(padding: EdgeInsets.only(top: 4)),

                             Row(
                               children: [
                                 Container(
                                   alignment: Alignment.center,
                                   height: 18,
                                   padding: EdgeInsets.only(left: 12, right: 12),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                     color: Color.fromRGBO(221, 246, 235, 1),
                                   ),
                                   child: Text('Đúng giờ', style:  TextStyle(color: Color.fromRGBO(77,197,145, 1), fontSize: 10),),),
                                 Expanded(child: Container())
                               ],
                             )
                           ],
                         )
                     ),
                   ),
                 ),
               ],
             )

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
         ),
       ],
     )
     ),
   );
  }

}