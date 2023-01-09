import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/teaching_calendar.dart';
Widget appointmentBuilder(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment =
      calendarAppointmentDetails.appointments.first;
  return InkWell(
    onTap: (){
      Get.to(TeachingCalendar());
    },
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color.fromRGBO(254, 230, 211, 1),
        ),
        alignment: Alignment.centerLeft,
        width: calendarAppointmentDetails.bounds.width,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 16)),
            Text(appointment.subject,style: TextStyle(color: Color.fromRGBO(249, 154, 81, 1)),),
            Image.asset("assets/Images/iconClock.png"),
            Text(
              DateFormat(' (hh:mm').format(appointment.startTime) +
                  '-' +
                  DateFormat('hh:mm)').format(appointment.endTime),
              textAlign: TextAlign.center,style: TextStyle(fontSize: 12),
            ),
          ],
        )
    ),
  );
}