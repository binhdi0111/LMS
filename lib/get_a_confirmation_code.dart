import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:dangnhap_lms/learning_management.dart';
import 'package:dangnhap_lms/reset_password.dart';

class Get_a_confirmation_code extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Detail_Get_a_confirmation_code();
  }
}

class Detail_Get_a_confirmation_code extends State<Get_a_confirmation_code> {
  TextEditingController controllerUserName = TextEditingController();
  bool Enable_textfield = true;
  bool Enable_container = false;
  int? indexTextfield;
  int indexOTP = 0;
  List<bool> showOTP = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 4; i++) {
      showOTP.add(false);
    }
    showOTP[indexOTP] = true;
  }

  showBorder(index){
    for (int i = 0; i < 4; i++) {
      showOTP.add(false);
    }
    showOTP[index] = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 53),
              child: Row(
                children: [
               InkWell(
                 onTap: (){
               Get.back();
                 },
                 child: Icon(Icons.arrow_back_outlined),
               )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 88,
                    child: const Text(
                      'Vui Lòng Kiểm Tra Email',
                      style: TextStyle(
                          fontSize: 36,
                          color: Color.fromRGBO(26, 26, 26, 1),
                          fontFamily: 'static/Inter-Medium.ttf',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8),
                      width: double.infinity,
                      height: 45,
                      child: const Text(
                        'Slova đã gửi e-mail xác nhận và đặt lại mật khẩu tới emi*******10122000@gmail.com. Vui lòng kiểm tra Hộp thư đến hoặc Hộp thư Spam.',
                        style: TextStyle(
                            color: Color.fromRGBO(133, 133, 133, 1),
                            fontSize: 12,
                            fontFamily: 'static/Inter-Regular.ttf'),
                      ))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                width: 300,
                child: Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:indexOTP == 0?
                              const Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(133, 133, 133, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                indexOTP++;
                                showBorder(indexOTP);
                              }
                            });
                          },
                          autofocus: true,
                          decoration: InputDecoration(
                              border: indexOTP == 0
                                  ?UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                                  :InputBorder.none,
                              focusedBorder:UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                          ),
                          cursorColor: Colors.white,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:indexOTP == 1?
                              const Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(133, 133, 133, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                indexOTP++;
                                showBorder(indexOTP);
                              }
                            });
                          },
                          decoration: InputDecoration(
                              border: indexOTP == 1
                                  ?UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                                  :InputBorder.none,
                              focusedBorder:UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                          ),
                          cursorColor: Colors.white,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:indexOTP == 2?
                              const Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(133, 133, 133, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                indexOTP++;
                                showBorder(indexOTP);
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: indexOTP == 2
                                ?UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                                :InputBorder.none,
                            focusedBorder:UnderlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                          ),

                          cursorColor: Colors.white,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:indexOTP == 3?
                              const Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(133, 133, 133, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                indexOTP++;
                                showBorder(indexOTP);
                              }
                            });
                          },
                          decoration: InputDecoration(
                              border: indexOTP == 3
                                  ?UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                                  :InputBorder.none,
                              focusedBorder:UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1)))
                          ),
                          cursorColor: Colors.white,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(Learning_management());
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          backgroundColor: Color.fromRGBO(248, 129, 37, 1)),
                      child: const Text(
                        'Nhập Mã Xác Nhận',
                        style: TextStyle(fontSize: 16),
                      )),
                ),
            Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 22),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'Bạn chưa nhận được Email?',
                          style: TextStyle(
                              color: Color.fromRGBO(177, 177, 177, 1),
                              fontSize: 12,
                              fontFamily: 'static/Inter-Regular.ttf')),
                      TextSpan(
                          text: ' Gửi lại mã',
                          style: TextStyle(
                              color: Color.fromRGBO(248, 129, 37, 1),
                              fontSize: 12,
                              fontFamily: 'static/Inter-Regular.ttf')),
                    ]),
                  ),
                ),
            Expanded(flex: 1, child: Container()),

              ],
            ),
        ),
      ));
  }
}
