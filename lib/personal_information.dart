import 'package:flutter/material.dart';
import 'package:dangnhap_lms/models/detail_item.dart';
class Personal_information extends StatefulWidget{
  const Personal_information({super.key});

  @override
  State<StatefulWidget> createState() {
    return Detail_Personal_information();
  }

}
class Detail_Personal_information extends State<Personal_information>{
  @override
  Widget build(BuildContext context) {

    List<Detail_item_information> itemInformation = [Detail_item_information(UserName: 'Nguyễn Minh Nhật', Class: '11a1', Phone: 012346788965, Email: 'Nhat@gmail.com', School: "fpt")];
    ListView _list_information() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: itemInformation.length,
          itemBuilder: (context, index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Họ Và Tên: ',style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1), fontSize: 12, fontFamily: 'static/Inter-Medium.ttf'),),
                    Expanded(child: Container()),
                    Text('${itemInformation[index].UserName}', style: TextStyle(color: Color.fromRGBO(248, 129, 37, 1), fontSize: 14,fontFamily: 'static/Inter-Medium.ttf' ),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Text('Lớp: ',style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1), fontSize: 12, fontFamily: 'static/Inter-Medium.ttf'),),
                    Expanded(child: Container()),
                    Text('${itemInformation[index].Class}', style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1), fontSize: 14,fontFamily: 'static/Inter-Medium.ttf' ),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Text('Số Điện Thoại: ',style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1), fontSize: 12, fontFamily: 'static/Inter-Medium.ttf'),),
                    Expanded(child: Container()),
                    Text('${itemInformation[index].Phone}', style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1), fontSize: 14,fontFamily: 'static/Inter-Medium.ttf' ),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Text('Email: ',style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1), fontSize: 12, fontFamily: 'static/Inter-Medium.ttf'),),
                    Expanded(child: Container()),
                    Text('${itemInformation[index].Email}', style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1), fontSize: 14,fontFamily: 'static/Inter-Medium.ttf' ),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Text('Trường : ',style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1), fontSize: 12, fontFamily: 'static/Inter-Medium.ttf'),),
                    Expanded(child: Container()),
                    Text('${itemInformation[index].School}', style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1), fontSize: 14,fontFamily: 'static/Inter-Medium.ttf' ),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),

              ],
            );
          });

    }
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        body:
        SafeArea(
          child:  Center(
            child:
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(255,255,255,1),
                    ),

                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          margin: EdgeInsets.only(top: 10),
                          child: Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                child: Image.asset('assets/Images/Image_user.png'),
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Image.asset('assets/Images/Camera_information.png'))
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 16, bottom: 8),
                            height: 40,
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Nguyễn Minh Nhật',style:TextStyle(color: Color.fromRGBO(26, 26, 26, 1), fontSize: 16, fontFamily: 'static/Inter-Medium.ttf',fontWeight: FontWeight.bold), ),
                                Padding(padding: EdgeInsets.only(top: 4)),
                                Text('fatdinasours@gmail.com', style: TextStyle(color: Color.fromRGBO(133,133, 133, 1), fontSize: 10,),)
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  Container(
                    width: 380,
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(255,255,255,1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16, bottom: 16, right: 9, left: 9),
                          child:   Row(
                            children: [
                              Text('Thông Tin Cá Nhân', style:TextStyle(color: Color.fromRGBO(133, 133, 133, 1), fontSize: 12),),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: (){

                                },
                                child:  Row(children: [
                                  Text('Chỉnh sửa',style:TextStyle(color: Color.fromRGBO(248, 129, 37, 1), fontSize: 12, fontFamily: 'static/Inter-Regular.ttf')),
                                  Icon(Icons.edit, color: Color.fromRGBO(248, 129, 37, 1),size: 16,)
                                ],),
                              )
                            ],
                          ),

                        ),
                        Container(
                          margin: EdgeInsets.all(9),
                          child: _list_information(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 380,
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(255,255,255,1),
                    ),
                    child:  Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8, left: 9 ,right: 9),
                          child:    Row(children: [
                            Text('Cài Đặt', textAlign: TextAlign.left,style: TextStyle(color: Color.fromRGBO(133,133, 133,1), fontSize: 12, fontFamily: 'static/Inter-Medium.ttf'),),
                            Expanded(child: Container())
                          ],) ,
                        ),
                        Padding(padding: EdgeInsets.only(top: 16)),
                        Container(
                          margin: EdgeInsets.only(left: 9),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Hỗ Trợ', style:  TextStyle(color:Color.fromRGBO(24, 29, 39, 1), fontSize: 14, fontFamily: 'static/Inter-Medium.ttf'),),
                                  Expanded(child: Container()),
                                  IconButton(
                                      iconSize: 24,
                                      onPressed: (){},
                                      icon: Icon(Icons.navigate_next, color: Color.fromRGBO(248, 129, 37, 1),))
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Đổi Mật Khẩu ', style:  TextStyle(color:Color.fromRGBO(24, 29, 39, 1), fontSize: 14, fontFamily: 'static/Inter-Medium.ttf'),),
                                  Expanded(child: Container()),
                                  IconButton(
                                      iconSize: 24,
                                      onPressed: (){},
                                      icon: Icon(Icons.navigate_next, color: Color.fromRGBO(248, 129, 37, 1),))
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Chính Sách Bảo Mật', style:  TextStyle(color:Color.fromRGBO(24, 29, 39, 1), fontSize: 14, fontFamily: 'static/Inter-Medium.ttf'),),
                                  Expanded(child: Container()),
                                  IconButton(
                                      iconSize: 24,
                                      onPressed: (){},
                                      icon: Icon(Icons.navigate_next, color: Color.fromRGBO(248, 129, 37, 1),))
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Điều Khoản Sử Dụng', style:  TextStyle(color:Color.fromRGBO(24, 29, 39, 1), fontSize: 14, fontFamily: 'static/Inter-Medium.ttf'),),
                                  Expanded(child: Container()),
                                  IconButton(
                                      iconSize: 24,
                                      onPressed: (){},
                                      icon: Icon(Icons.navigate_next, color: Color.fromRGBO(248, 129, 37, 1),))
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Đăng Xuất', style:  TextStyle(color:Color.fromRGBO(24, 29, 39, 1), fontSize: 14, fontFamily: 'static/Inter-Medium.ttf'),),
                                  Expanded(child: Container()),
                                  IconButton(
                                      iconSize: 24,
                                      onPressed: (){},
                                      icon: Icon(Icons.navigate_next, color: Color.fromRGBO(248, 129, 37, 1),))
                                ],
                              ),

                            ],

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ) ,
          ),
        )
    );
  }

}