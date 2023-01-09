import 'package:flutter/material.dart';
import 'models/detail_item.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/get_a_confirmation_code.dart';
import 'package:dangnhap_lms/login.dart';
import 'package:dangnhap_lms/send_notification.dart';
import 'package:dangnhap_lms/exercise.dart';
import 'package:flutter_svg/svg.dart';
class Learning_management extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Detail_Learning_management();
  }
}

class Detail_Learning_management extends State<Learning_management> {
  bool isVisiable_class = false;
  bool isVisiable_subject= false;
  bool isVisiable_subject_score= false;
  bool isVisiable_notifi= false;
  bool isVisiable_broadly = false;
  int? indexItem_subject_score;
  int? indexItem_subject;




  List<Detail_item_notifi> _listNotifi =[];
  List<Detail_item_subject_score> _list_subject_score=[
    Detail_item_subject_score(urlImage: 'assets/Images/doc_false.svg', nameStatusdiemmonhoc: 'Xem Điểm Môn'),
    Detail_item_subject_score(urlImage: 'assets/Images/doc_false.svg', nameStatusdiemmonhoc: 'Cập Nhật Điểm'),
  ];

  List<Detail_item_subject_score> _list_subject=[
    Detail_item_subject_score(urlImage: 'assets/Images/doc_false.svg', nameStatusdiemmonhoc: 'Xem Bài Tập'),
    Detail_item_subject_score(urlImage: 'assets/Images/doc_false.svg', nameStatusdiemmonhoc: 'Tạo Bài Tập Mới'),
    Detail_item_subject_score(urlImage: 'assets/Images/doc_false.svg', nameStatusdiemmonhoc: 'Tạo Bài Kiểm Tra'),
    Detail_item_subject_score(urlImage: 'assets/Images/doc_false.svg', nameStatusdiemmonhoc: 'Chấm Điểm'),
  ];



  @override
  void initState() {
   for(int i =2; i<=10; i++){
     _listNotifi.add(Detail_item_notifi(id: i, content:'1. Lorem Ipsum is simply dummy text of the fhifsu sudfshdf ssi'));
   }
  }


  ListView _detail_listNotifi (){
    return ListView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _listNotifi.length,
        itemBuilder:(context, index){
          return
            Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Thông Báo ${_listNotifi[index].id}', style:  TextStyle(color: Color.fromRGBO(248, 129, 37, 1),fontSize: 12),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12.5)),
                Row(children: [
                 Expanded(child:  Text('${_listNotifi[index].content}', style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 14),))
                ],),
                Divider()
              ],
            ),
          );

        }
        );
  }

  ListView _detai_list_subject_score(){
    return ListView.builder(
      shrinkWrap: true,
        itemCount: _list_subject_score.length,
        itemBuilder:(context, index){
          return
           InkWell(
             onTap: (){
               setState(() {
                 indexItem_subject_score= index;
                 if(indexItem_subject_score==0){
                   Get.to(Get_a_confirmation_code());
                 }
                 if(indexItem_subject_score==1){
                   Get.to(Login() );
                 }
               });
             },
             child:  Container(
               margin: EdgeInsets.only(top: 17),
               padding: EdgeInsets.only(left: 16),
               height: 40,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: index== indexItem_subject_score?Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(255, 255, 255, 1),
                   border: Border.all(
                       color: Color.fromRGBO(
                           239, 239, 239, 1))),
               child: Row(
                 children: [
                   index== indexItem_subject_score ? SvgPicture.asset('assets/Images/doc_true.svg') :SvgPicture.asset('${_list_subject_score[index].urlImage}') ,
                   Padding(
                       padding: EdgeInsets.only(left: 9)),
                   Text(
                     '${_list_subject_score[index].nameStatusdiemmonhoc}',
                     style: TextStyle(
                         color:index== indexItem_subject_score? Color.fromRGBO(255, 255, 255, 1): Color.fromRGBO(90, 90, 90, 1) ,
                         fontSize: 14),
                   )
                 ],
               ),
             ),
           );
        } );
  }

  ListView _detai_list_subject(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _list_subject.length,
        itemBuilder:(context, index){
          return
            InkWell(
              onTap: (){
                setState(() {
                  indexItem_subject= index;
                  if(indexItem_subject==0){
                    Get.to(Exercise());
                  }
                });
              },
              child:  Container(
                margin: EdgeInsets.only(top: 17),
                padding: EdgeInsets.only(left: 16),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:  index== indexItem_subject?Color.fromRGBO(248, 129, 37, 1):Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                        color: Color.fromRGBO(
                            239, 239, 239, 1))),
                child: Row(
                  children: [
                    index== indexItem_subject ? SvgPicture.asset('assets/Images/doc_true.svg') :SvgPicture.asset('${_list_subject[index].urlImage}') ,
                    Padding(
                        padding: EdgeInsets.only(left: 9)),
                    Text(
                      '${_list_subject[index].nameStatusdiemmonhoc}',
                      style: TextStyle(
                          color:  index== indexItem_subject ? Color.fromRGBO(255, 255, 255, 1): Color.fromRGBO(90, 90, 90, 1) ,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            );
        } );
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
          'Quản Lý Học Tập',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'static/Inter-Medium.ttf'),
        ),
      ),
      body: SingleChildScrollView(
        child:

      Container(
        margin: EdgeInsets.only(top: 16, right: 16, left: 16),
        child:   Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isVisiable_class=! isVisiable_class;
                        });
                      },
                      child:Row(
                        children: [
                          Text(
                            'Lớp Học',
                            style: TextStyle(
                                color: Color.fromRGBO(26, 26, 26, 1),
                                fontSize: 16),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 2, bottom: 2),
                            alignment: Alignment.center,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(248, 129, 37, 1),
                            ),
                            child: Text(
                              '11D2',
                              style:
                              TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                          Expanded(child: Container()),
                          isVisiable_class ? Icon(Icons.keyboard_arrow_up, size: 24, color: Color.fromRGBO(26, 26, 26, 1),) : Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Color.fromRGBO(26, 26, 26, 1),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                        visible: isVisiable_class,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 25)),
                            Row(
                              children: [
                                Text(
                                  '1. Danh Sách Lớp',
                                  style: TextStyle(
                                      color: Color.fromRGBO(26, 26, 26, 1),
                                      fontSize: 14),
                                ),
                                Expanded(child: Container()),
                                InkWell(

                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromRGBO(248, 129, 37, 1),
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 25)),
                            Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      isVisiable_subject_score=!isVisiable_subject_score;
                                    });
                                  },
                                  child:  Row(
                                    children: [
                                      Text(
                                        '2. Điểm Môn Học',
                                        style: TextStyle(
                                            color: Color.fromRGBO(26, 26, 26, 1),
                                            fontSize: 14),
                                      ),
                                      Expanded(child: Container()),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color.fromRGBO(248, 129, 37, 1),
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),

                                Visibility(
                                    visible: isVisiable_subject_score,
                                    child:
                                    Container(

                                      child: this._detai_list_subject_score(),
                                    )
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 16)),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.all(16),
                child:
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isVisiable_notifi=! isVisiable_notifi;
                        });
                      },
                      child:   Row(
                        children: [
                          Text(
                            'Thông Báo',
                            style: TextStyle(
                                color: Color.fromRGBO(26, 26, 26, 1), fontSize: 16),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Color.fromRGBO(26, 26, 26, 1),
                          ),
                        ],
                      ),
                    ),

                    Visibility(
                        visible: isVisiable_notifi,
                        child: Column(children: [
                        Container(
                        margin: EdgeInsets.only(top:24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Thông Báo 1', style:  TextStyle(color: Color.fromRGBO(248, 129, 37, 1),fontSize: 12),),
                              Expanded(child: Container()),
                              Text('Bỏ Ghim', style: TextStyle(color: Color.fromRGBO(255, 69, 89, 1),fontSize: 12),)
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 12.5)),
                          Row(children: [
                            Text('1.djjjjjjjjjjjjjjjjjjjjjkdkjdjdjdjdjddj', style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 14),)
                          ],),
                          Divider(),
                          Visibility(
                            visible: isVisiable_broadly,
                            child:
                            Container(
                              child:this._detail_listNotifi(),
                            ),)
                        ],
                      ),
                    ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(MySendNotification());
                                },
                                child: Row(
                                  children: [
                                    Text('Tạo Thông Báo Mới',style: TextStyle(color: Color.fromRGBO(248, 129, 37, 1), fontSize: 12),),
                                    Icon(Icons.add,size: 24,color: Color.fromRGBO(248, 129, 37, 1),),
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isVisiable_broadly =! isVisiable_broadly;
                                  });
                                },
                                child:
                                Row(
                                  children: [
                                    Text( isVisiable_broadly ? 'Thu Gọn': 'Mở Rộng',style: TextStyle(color: Color.fromRGBO(26, 59, 112, 1),fontSize: 12),),
                                    Icon( isVisiable_broadly ?Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,size: 24,color: Color.fromRGBO(26, 59, 112, 1),),
                                  ],
                                ),),


                            ],
                          ),

                        ],))

                  ],
                )
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isVisiable_subject=! isVisiable_subject;
                        });
                      },
                      child:    Row(
                        children: [
                          Text(
                            'Môn Học',
                            style: TextStyle(
                                color: Color.fromRGBO(26, 26, 26, 1),
                                fontSize: 16),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 2, bottom: 2),
                            alignment: Alignment.center,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(248, 129, 37, 1),
                            ),
                            child: Text(
                              'Toán Học',
                              style:
                              TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                          Expanded(child: Container()),
                          isVisiable_subject ? Icon(Icons.keyboard_arrow_up, size: 24, color: Color.fromRGBO(26, 26, 26, 1),) : Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Color.fromRGBO(26, 26, 26, 1),
                          )
                        ],
                      ),
                    ),

                    Visibility(
                        visible: isVisiable_subject,
                        child:
                        Container(
                          child: this._detai_list_subject(),
                        )
                    )
                  ],
                )),
            Text('aaa')
          ],
        ),
      )
      ),
    );
  }
}
