import 'package:dangnhap_lms/diligence.dart';
import 'package:flutter/material.dart';
import 'package:dangnhap_lms/models/subject.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/personal_information.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:dangnhap_lms/attendance.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'appointment_builder_timelineday.dart';
import 'package:dangnhap_lms/learning_management.dart';

class DashBoard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Subject> listSubject = <Subject>[
      Subject(name: "Toán", image: "assets/Images/imageMath.png"),
      Subject(name: "Sinh học", image: "assets/Images/imageBiological.png"),
      Subject(name: "Văn học", image: "assets/Images/imageLiterature.png"),
      Subject(name: "Âm nhạc", image: "assets/Images/imageMusic.png"),
      Subject(name: "Địa lý", image: "assets/Images/imageGeography.png"),
      Subject(name: "Lịch sử", image: "assets/Images/imageHistory.png"),
    ];
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/Images/Logo_HomPage.png",
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 150)),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 20, 16, 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            SizedBox(
                              width: 200,
                              child: Text("Môn Học",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                      Color.fromRGBO(26, 26, 26, 1))),
                            ),
                            Padding(padding: EdgeInsets.only(top: 6)),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "Năm nay bạn có 12 môn học",
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                    Color.fromRGBO(133, 133, 133, 1)),
                              ),
                            ),
                          ],
                        ),
                        Flexible(child: Container()),
                        const Text(
                          "Xem Tất cả",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(248, 129, 37, 1)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 280,
                    child: GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing:
                          5, //khoảng cách theo chiều dọc
                          mainAxisSpacing:
                          5, //khoảng cách teho chiều ngang
                        ),
                        scrollDirection: Axis.vertical, //chiều cuộn
                        physics: const ClampingScrollPhysics(),
                        itemCount: listSubject.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "${listSubject[index].image}"),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 8)),
                                  Text(
                                    "${listSubject[index].name}",
                                    style: const TextStyle(
                                        color: Color.fromRGBO(
                                            26, 26, 26, 1),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 20, 16, 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            SizedBox(
                              width: 200,
                              child: Text("Thời khóa biểu",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                      Color.fromRGBO(26, 26, 26, 1))),
                            ),
                            Padding(padding: EdgeInsets.only(top: 6)),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "Năm nay bạn có 12 môn học",
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                    Color.fromRGBO(133, 133, 133, 1)),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "Xem Tất cả",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(248, 129, 37, 1)),
                        )
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                    ),
                    margin: const EdgeInsets.only(left: 16,right: 16,bottom: 20),
                    child: Container(

                      child: SfCalendar(
                        view: CalendarView.timelineDay,
                        firstDayOfWeek: 2,
                        dataSource: MeetingDataSource(getAppointments()),
                        todayHighlightColor: Color.fromRGBO(249, 154, 81, 1),
                        appointmentBuilder: appointmentBuilderTimeLineDay,
                        scheduleViewSettings: ScheduleViewSettings(
                            appointmentItemHeight: 20
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 240,
                  right: 16,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        ListTile(
                          leading:
                          Image.asset("assets/Images/Logo_App.png"),
                          title: const Text(
                            "Chào, Đặng Văn Bình",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(26, 26, 26, 1)),
                          ),
                          subtitle: const Text(
                            "Lớp 12A2",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(26, 26, 26, 1)),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 16)),
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 16)),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: (){
                                  Get.to(Attendance());
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/Images/iconAttendance.svg",
                                      color: Color.fromRGBO(248, 129, 37, 1),),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 11)),
                                    const Text(
                                      "Chuyên cần",
                                      style: TextStyle(
                                          color:
                                          Color.fromRGBO(26, 26, 26, 1),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  Get.to(Learning_management());
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/Images/iconCalendar.svg"),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 11)),
                                    const Text(
                                      "Lịch",
                                      style: TextStyle(
                                          color:
                                          Color.fromRGBO(26, 26, 26, 1),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/Images/iconTranscript.svg"),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 11)),
                                    const Text(
                                      "Bảng điểm",
                                      style: TextStyle(
                                          color:
                                          Color.fromRGBO(26, 26, 26, 1),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: (){
                                    Get.to(Personal_information());
                                  },
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/Images/iconPersonal.svg"),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 11)),
                                      const Text(
                                        "Cá nhân",
                                        style: TextStyle(
                                            color:
                                            Color.fromRGBO(26, 26, 26, 1),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                )),
                            const Padding(padding: EdgeInsets.only(right: 16)),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 16)),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }

}
List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year,today.month,today.day,9,0,0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  final DateTime startTimeChemistry = DateTime(today.year,today.month,today.day,10,0,0);
  final DateTime endTimeChemistry = startTimeChemistry.add(const Duration(hours: 2));
  final DateTime startTimePhysical= DateTime(today.year,today.month,today.day,11,0,0);
  final DateTime endTimePhysical = startTimePhysical.add(const Duration(hours: 2));
  meetings.add(Appointment(startTime: startTime, endTime: endTime,subject: "Toán",color: Color.fromRGBO(249, 154, 81, 1)));
  meetings.add(Appointment(startTime: startTimeChemistry, endTime: endTimeChemistry,subject: "Hóa",color: Color.fromRGBO(72, 98, 141, 1)));
  meetings.add(Appointment(startTime: startTimePhysical, endTime: endTimePhysical,subject: "Lý",color: Color.fromRGBO(253, 185, 36, 1)));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}