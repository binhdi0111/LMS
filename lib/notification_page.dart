import 'package:flutter/material.dart';
import 'models/detail_item.dart';
class Notification_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Detail_Notification();
  }
}

class Detail_Notification extends State<Notification_Page> {
  @override
  Widget build(BuildContext context) {
    List<Detail_item> _notification = [

      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 1),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 1),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 4),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 2),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 3),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 9),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 10),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 1),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 1),
      Detail_item(
          TeacherName: 'Cô Thảo(GV Toán)',
          UrlAvata: 'assets/Images/Avatar_teacher.png',
          Date_time: '1 giờ trước', Number_of_exercises: 1),
    ];

    ListView _list_item_notifi() {
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _notification.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 86,
                  width: 343,
                  child: Container(
                    width: 327,
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          child:
                          Image.asset('${_notification[index].UrlAvata}'),
                        ),

                      Expanded(child:   Container(
                        margin: EdgeInsets.only(left: 8,top: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 270,
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: '[Bài tập] ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                248, 129, 37, 1),
                                            fontSize: 16)),
                                    TextSpan(
                                        text:
                                        '${_notification[index].TeacherName}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                26, 26, 26, 1),
                                            fontSize: 16)),
                                    TextSpan(
                                        text: ' đã thêm ${_notification[index].Number_of_exercises} bài tập',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                26, 26, 26, 1),
                                            fontSize: 16)),
                                  ])),
                            ),
                            Container(
                              width: 270,
                              margin: EdgeInsets.only(right: 4),
                              child: Text(
                                '${_notification[index].Date_time}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(114, 116, 119, 1),
                                    fontSize: 10),
                              ),
                            ),

                          ],
                        ),
                      ),),
                      InkWell(
                        onTap: (){

                        },
                        child:   Container(
                          width: 14,
                          height: 16,
                          child: Image.asset('assets/Images/icon_notifi.png'),
                        ),
                      )

                      ],
                    ),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                )
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(248, 129, 37, 1),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        title: Text(
          'Thông báo',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'static/Inter-Medium.ttf'),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8,top: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' Hôm nay',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'static/Inter-Medium.ttf',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white
                    ),
                    child: _list_item_notifi(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' Trước đó',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'static/Inter-Medium.ttf',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white
                    ),
                    child: _list_item_notifi(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}