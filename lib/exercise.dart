import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'models/detail_item.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'detail_exercise.dart';

class Exercise extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Detail_Exercise();
  }
}

class Detail_Exercise extends State<Exercise> {

  int ? indexItem_exercisre;
  List<Detail_item_date_exercise> _list_date_exercise = [
    Detail_item_date_exercise(
        week: 1, startDate: ' 10/12/2022', endDate: '17/12/2022'),
    Detail_item_date_exercise(
        week: 2, startDate: ' 10/12/2022', endDate: '17/12/2022'),
    Detail_item_date_exercise(
        week: 3, startDate: ' 10/12/2022', endDate: '17/12/2022'),
  ];
  List<Detail_item_exercise> _list_exercise = [
    Detail_item_exercise(
        urlImg: 'assets/Images/icon_exercise.svg',
        exerciseName: 'Assessment Task 1 - Case Note',
        assignmentCreationTime:
            DateFormat.yMd().add_jm().format(DateTime.now()),
        typOfExercise: 'Trắc nghiệm'),
    Detail_item_exercise(
        urlImg: 'assets/Images/icon_exercise.svg',
        exerciseName: 'Assessment Task 1 - Case Note',
        assignmentCreationTime:
            DateFormat.yMd().add_jm().format(DateTime.now()),
        typOfExercise: 'Tự Luận'),
    Detail_item_exercise(
        urlImg: 'assets/Images/icon_exercise.svg',
        exerciseName: 'Assessment Task 1 - Case Note',
        assignmentCreationTime:
            DateFormat.yMd().add_jm().format(DateTime.now()),
        typOfExercise: 'Trắc nghiệm'),
  ];
  ListView detail_list_date_exercise() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _list_date_exercise.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 23,
                width: double.infinity,
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4)),
                    color: Color.fromRGBO(246, 246, 246, 1)),
                padding: EdgeInsets.only(top: 4, bottom: 4, left: 10),
                child: Text(
                  'Tuần ${_list_date_exercise[index].week}\: ${_list_date_exercise[index].startDate}\-${_list_date_exercise[index].endDate}',
                  style: TextStyle(
                      color: Color.fromRGBO(133, 133, 133, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'assets/font/static/Inter-Medium.ttf'),
                ),
              ),
              Visibility(

                  child: Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                child: this.detail_item_exercise(),
              ))
            ],
          );
        });
  }

  ListView detail_item_exercise() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _list_exercise.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 8),
                child:

               InkWell(
                 onTap: (){
                   setState(() {
                     Get.to(Detail_Exercise_Page());
                   });
                 },
                 child:
                 Row(
                   children: [
                     SvgPicture.asset('${_list_exercise[index].urlImg}'),
                     Padding(padding: EdgeInsets.only(right: 8)),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           '${_list_exercise[index].exerciseName}',
                           style: TextStyle(
                               color: Color.fromRGBO(26, 26, 26, 1),
                               fontSize: 14,
                               fontWeight: FontWeight.w500,
                               fontFamily:
                               'assets/font/static/Inter-Medium.ttf'),
                         ),
                         Padding(padding: EdgeInsets.only(top: 4)),
                         RichText(
                             text: TextSpan(children: [
                               TextSpan(
                                   text: 'Thời gian tạo: ',
                                   style: TextStyle(
                                       color: Color.fromRGBO(133, 133, 133, 1),
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       fontFamily:
                                       'assets/font/static/Inter-Medium.ttf')),
                               TextSpan(
                                   text:
                                   '${_list_exercise[index].assignmentCreationTime}',
                                   style: TextStyle(
                                       color: Color.fromRGBO(26, 26, 26, 1),
                                       fontSize: 12,
                                       fontWeight: FontWeight.w500,
                                       fontFamily:
                                       'assets/font/static/Inter-Medium.ttf'))
                             ])),
                         Padding(padding: EdgeInsets.only(top: 4)),
                         RichText(
                             text: TextSpan(children: [
                               TextSpan(
                                   text: 'Loại bài tập: ',
                                   style: TextStyle(
                                       color: Color.fromRGBO(133, 133, 133, 1),
                                       fontWeight: FontWeight.w500,
                                       fontSize: 12,
                                       fontFamily:
                                       'assets/font/static/Inter-Medium.ttf')),
                               TextSpan(
                                   text: '${_list_exercise[index].typOfExercise}',
                                   style: TextStyle(
                                       color: Color.fromRGBO(248, 129, 37, 1),
                                       fontSize: 12,
                                       fontWeight: FontWeight.w500,
                                       fontFamily:
                                       'assets/font/static/Inter-Medium.ttf'))
                             ])),
                       ],
                     ),
                     Expanded(child: Container()),
                     Icon(
                       Icons.arrow_forward_ios_rounded,
                       color: Color.fromRGBO(26, 26, 26, 1),
                       size: 16,
                     )
                   ],
                 ),
               )
              ),
              Divider()
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
            color: Colors.white,
          )
        ],
        backgroundColor: Color.fromRGBO(248, 129, 37, 1),
        title: Text(
          'Bài Tập',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'static/Inter-Medium.ttf'),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16, right: 16, left: 16),
        child: this.detail_list_date_exercise(),
      ),
    );
  }
}
