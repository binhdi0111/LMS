import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'models/detail_item.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/edit_exercises.dart';

class Detail_Exercise_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return is_Detail_Exercise_Page();
  }
}

class is_Detail_Exercise_Page extends State<Detail_Exercise_Page> {
  List<Detail_item_exerciseFiles> _list_file = [
    Detail_item_exerciseFiles(
        urlImage: 'assets/Images/icon_upload_img.svg', title: 'bai1.JEPG'),
    Detail_item_exerciseFiles(
        urlImage: 'assets/Images/icon_upload_img.svg', title: 'bai2.JEPG'),
    Detail_item_exerciseFiles(
        urlImage: 'assets/Images/icon_upload_img.svg', title: 'bai3.JEPG'),
    Detail_item_exerciseFiles(
        urlImage: 'assets/Images/icon_upload_img.svg', title: 'bai4.JEPG'),
  ];

  ListView _item_list_file() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _list_file.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color.fromRGBO(246, 246, 246, 1)),
            child: Row(
              children: [
                SvgPicture.asset('assets/Images/icon_upload_img.svg'),
                Padding(padding: EdgeInsets.only(left: 8)),
                Text(
                  '${_list_file[index].title}',
                  style: TextStyle(
                      color: Color.fromRGBO(26, 59, 112, 1),
                      fontSize: 14,
                      fontFamily: 'assets/font/static/Inter-Medium.ttf',
                      fontWeight: FontWeight.w500),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    setState(() {
                      _list_file.removeAt(index);
                    });
                  },
                  child: SvgPicture.asset('assets/Images/icon_deleteFile.svg'),
                )
              ],
            ),
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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assessment Task 1 - Case Note',
                    style: TextStyle(
                        color: Color.fromRGBO(133, 133, 133, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'assets/font/static/Inter-Medium.ttf'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Row(
                    children: [
                      Text(
                        'Ngày Tạo',
                        style: TextStyle(
                            color: Color.fromRGBO(133, 133, 133, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'assets/font/static/Inter-Medium.ttf'),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '2/11/2021 15:05:01',
                        style: TextStyle(
                            color: Color.fromRGBO(26, 26, 26, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'assets/font/static/Inter-Regular.ttf'),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Row(
                    children: [
                      Text(
                        'Hạn Nộp',
                        style: TextStyle(
                            color: Color.fromRGBO(133, 133, 133, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'assets/font/static/Inter-Medium.ttf'),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '7/11/2021 10:00:00',
                        style: TextStyle(
                            color: Color.fromRGBO(26, 26, 26, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'assets/font/static/Inter-Regular.ttf'),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Text('File Bài Tập',
                      style: TextStyle(
                          color: Color.fromRGBO(26, 26, 26, 1),
                          fontFamily: 'assets/font/static/Inter-Medium.ttf',
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Padding(padding: EdgeInsets.only(top: 4)),
                  DottedBorder(
                      dashPattern: [5, 5],
                      radius: Radius.circular(8),
                      borderType: BorderType.RRect,
                      color: Color.fromRGBO(133, 133, 133, 1),
                      child: Container(
                        margin: EdgeInsets.only(right: 12, left: 12),
                        child: Column(
                          children: [
                            Container(
                              child: this._item_list_file(),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Xóa Tệp',
                                      style: TextStyle(
                                          color: Color.fromRGBO(255, 69, 89, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily:
                                              'assets/font/static/Inter-Regular.ttf')),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(Edit_Exercise());
                                  },
                                  child: Text('Sửa Tệp',
                                      style: TextStyle(
                                          color: Color.fromRGBO(72, 98, 141, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily:
                                              'assets/font/static/Inter-Regular.ttf')),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              height: 78,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(248, 129, 37, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Chấm Điểm',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )),
            )
          ],
        ));
  }
}
