import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/login.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Start(),
  ));
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 54,left: 16,right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: SvgPicture.asset('assets/Images/Logo_login.svg'),
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              height: 90,
              width: double.infinity,
              child: const Text(
                'Đồng Hành Và Phát Triển Giáo Dục',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 36.5,
                    color: Color.fromRGBO(26, 26, 26, 1),
                    fontFamily: 'assets/font/static/Inter-Medium.ttf', fontWeight: FontWeight.w500),

              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 35,
              width: double.infinity,
              child: const Text(
                'Hỗ trợ và giảm thiểu thời gian, công sức trong việc quá trình học tập của Học Sinh cho Giáo Viên, Phụ Huynh',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(133, 133, 133, 1),
                    fontSize: 12.5,
                    fontFamily: 'static/Inter-Regular.ttf'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 102),
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(Login());
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      backgroundColor: Color.fromRGBO(248, 129, 37, 1)),
                  child: const Text(
                    'Đăng Nhập',
                    style: TextStyle(fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}





