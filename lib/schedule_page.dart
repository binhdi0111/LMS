import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'appointment_builder.dart';

class MySchedule extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Schedule();
  }

}
class Schedule extends State<MySchedule>{
  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Công việc"),
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(248, 129, 37, 1),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(right: 16,left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text("Thời gian",style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1),fontSize: 12),),
              ),
              Card(
                child: Container(
                  child: TableCalendar(
                    firstDay: DateTime(2000), focusedDay: focusedDay, lastDay: DateTime(2030),
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format){
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: (DateTime selectDay, DateTime focusDay){
                      setState(() {
                        selectedDay = selectDay;
                        focusedDay = focusDay;
                      });
                    },
                    selectedDayPredicate: (DateTime date){
                      return isSameDay(selectedDay, date);
                    },
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                      selectedDecoration: BoxDecoration(
                          color: Color.fromRGBO(248, 129, 37, 1),
                          shape: BoxShape.circle
                      ),
                      selectedTextStyle: TextStyle(
                          color: Color.fromRGBO(26, 26, 26, 1),
                          fontSize: 14
                      ),
                      todayDecoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(color: Color.fromRGBO(248, 129, 37, 1)))),
                      todayTextStyle: TextStyle(
                          color: Color.fromRGBO(26, 26, 26, 1),
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text("Thời khóa biểu",style: TextStyle(color: Color.fromRGBO(26, 26, 26, 1),fontSize: 12),),
              ),
              Card(
                child: SfCalendar(
                  view: CalendarView.day,
                  showCurrentTimeIndicator: true,
                  viewHeaderStyle: ViewHeaderStyle(
                    dateTextStyle: TextStyle(color: Color.fromRGBO(26, 26, 26, 1))
                  ),
                  dataSource: MeetingDataSource(getAppointments()),
                  todayHighlightColor: Color.fromRGBO(249, 154, 81, 1),
                  appointmentBuilder: appointmentBuilder,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year,today.month,today.day,7,0,0);
  final DateTime endTime = startTime.add(const Duration(hours: 1));
  final DateTime startTime2 = DateTime(today.year,today.month,today.day,9,0,0);
  final DateTime endTime2 = startTime2.add(const Duration(hours: 1));
  meetings.add(Appointment(startTime: startTime, endTime: endTime,subject: "Toán"));
  meetings.add(Appointment(startTime: startTime2, endTime: endTime2,subject: "Toán"));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}