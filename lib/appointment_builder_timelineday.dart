import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
Widget appointmentBuilderTimeLineDay(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment =
      calendarAppointmentDetails.appointments.first;
  return Container(
      height: 20,
      color: appointment.color,
      alignment: Alignment.center,
      width: calendarAppointmentDetails.bounds.width,
      child: Text(appointment.subject,style: TextStyle(color: Colors.white,fontSize: 14),)
  );
}