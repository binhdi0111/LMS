import 'package:flutter/material.dart';
import 'models/detail_item.dart';

class Student_information extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Detail_Student_information();
  }
}

class Detail_Student_information extends State<Student_information> {
  List<Detail_item_information> item_Student_Information = [
    Detail_item_information(
        UserName: 'Nguyễn Minh Nhật',
        Class: '11a1',
        Phone: 012346788965,
        Email: 'Nhat@gmail.com',
        School: "fpt")
  ];


  ListView _list_student_information() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: item_Student_Information.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Họ Và Tên: ',
                    style: TextStyle(
                        color: Color.fromRGBO(133, 133, 133, 1),
                        fontSize: 12,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${item_Student_Information[index].UserName}',
                    style: TextStyle(
                        color: Color.fromRGBO(248, 129, 37, 1),
                        fontSize: 14,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    'Lớp: ',
                    style: TextStyle(
                        color: Color.fromRGBO(133, 133, 133, 1),
                        fontSize: 12,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${item_Student_Information[index].Class}',
                    style: TextStyle(
                        color: Color.fromRGBO(26, 26, 26, 1),
                        fontSize: 14,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    'Số Điện Thoại: ',
                    style: TextStyle(
                        color: Color.fromRGBO(133, 133, 133, 1),
                        fontSize: 12,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${item_Student_Information[index].Phone}',
                    style: TextStyle(
                        color: Color.fromRGBO(26, 26, 26, 1),
                        fontSize: 14,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    'Email: ',
                    style: TextStyle(
                        color: Color.fromRGBO(133, 133, 133, 1),
                        fontSize: 12,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${item_Student_Information[index].Email}',
                    style: TextStyle(
                        color: Color.fromRGBO(26, 26, 26, 1),
                        fontSize: 14,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    'Trường : ',
                    style: TextStyle(
                        color: Color.fromRGBO(133, 133, 133, 1),
                        fontSize: 12,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${item_Student_Information[index].School}',
                    style: TextStyle(
                        color: Color.fromRGBO(26, 26, 26, 1),
                        fontSize: 14,
                        fontFamily: 'static/Inter-Medium.ttf'),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
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
          'Thông Tin Học Sinh',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'static/Inter-Medium.ttf'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 400,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/Images/Image_user.png'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 16, bottom: 8),
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyễn Minh Nhật',
                            style: TextStyle(
                                color: Color.fromRGBO(26, 26, 26, 1),
                                fontSize: 16,
                                fontFamily: 'static/Inter-Medium.ttf',
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.only(top: 4)),
                          Text(
                            'fatdinasours@gmail.com',
                            style: TextStyle(
                              color: Color.fromRGBO(133, 133, 133, 1),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Container(
                padding: EdgeInsets.all(9),
                child: this._list_student_information(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
