import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dangnhap_lms/send_in_app_notifications.dart';
import 'package:get/get.dart';
class MySendNotification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SendNotification();
  }

}

class SendNotification extends State<MySendNotification>{
  bool isExpandParents = false;
  bool clickSMS = false;
  bool clickNotifyApp = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 129, 37, 1),
        elevation: 0,
        title: Text("Gửi Thông Báo",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
        actions: [
          Icon(Icons.home,color: Colors.white,),
          Padding(padding: EdgeInsets.only(right: 16))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isExpandParents = !isExpandParents;
                });
              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child:  Row(
                    children: [
                      Text("Học sinh",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w500),),
                      Expanded(child: Container()),
                      Visibility(
                        visible: isExpandParents == false,
                        child: Icon(Icons.arrow_forward_ios,color:  Color.fromRGBO(248, 129, 37, 1),size: 18,),),
                      Visibility(
                        visible: isExpandParents == true,
                        child: Icon(Icons.keyboard_arrow_up,color:  Color.fromRGBO(248, 129, 37, 1)),)
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
                visible: isExpandParents == true,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            clickSMS = true;
                            clickNotifyApp = false;

                          });
                        },
                          child: Container(
                        decoration: BoxDecoration(
                            color: clickSMS == true?Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(239, 239, 239, 1),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        padding: EdgeInsets.only(top: 8,left: 16,bottom: 8,right: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/Images/icon_sms.svg",color: clickSMS == true?Colors.white:Color.fromRGBO(90, 90, 90, 1),),
                            Text("Gửi Thông Báo Qua SMS",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: clickSMS == true?Colors.white:Color.fromRGBO(90, 90, 90, 1)),)
                          ],
                        ),
                      ),),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            clickSMS = false;
                            clickNotifyApp = true;
                            Get.to(MySendInAppNotification());
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: clickNotifyApp == true?Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(239, 239, 239, 1),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.only(top: 8,left: 16,bottom: 8,right: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/Images/icon_send_notify_app.svg",color: clickNotifyApp == true?Colors.white:Color.fromRGBO(90, 90, 90, 1),),
                              Text("Gửi Thông Báo Trên Ứng Dụng",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: clickNotifyApp == true?Colors.white:Color.fromRGBO(90, 90, 90, 1)),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            InkWell(
              onTap: () {
                setState(() {

                });
              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child:  Row(
                    children: [
                      Text("Cho Học sinh",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w500),),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios,color:  Color.fromRGBO(248, 129, 37, 1),size: 18,),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            InkWell(
              onTap: () {
                setState(() {

                });
              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child:  Row(
                    children: [
                      Text("Cho Phụ Huynh \& Học Sinh",style: TextStyle(fontSize: 14,color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w500),),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios,color:  Color.fromRGBO(248, 129, 37, 1),size: 18,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    ));
  }

}