import 'package:doctor_app/Services/doctor_content.dart';
import 'package:doctor_app/Services/pharmacy.dart';
import 'package:doctor_app/Services/report.dart';
import 'package:doctor_app/Services/searchAi_page.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Services {
  final String image;
  final Color color;
  final String title;
  final WidgetBuilder content;
  Services({
    required this.image,
    required this.color,
    required this.title,
    required this.content,
  });
}

// Services List OF DATA

List<Services> servicesList(BuildContext context) => [
      Services(
        image: 'assets/icons/doctor-Icon.svg',
        color: const Color(0xffDCEDF9),
        title: S.of(context).doctor,
        content: (BuildContext context) => DoctorContent(),
      ),
      Services(
        image: 'assets/icons/noun-pill.svg',
        color: const Color(0xffFAF0DB),
        title: S.of(context).pharmacies,
        content: (BuildContext context) => MapScreen(),
      ),
      Services(
        image: 'assets/icons/noun-medical-test.svg',
        color: const Color(0xffD6F6FF),
        title: S.of(context).report,
        content: (BuildContext context) => PrescriptionPage(
          patientName: 'Abdulrhman Mohamed Shabaan',
          additionalNotes: "He suffers from pimples on the skin",
          beforeAfterMeal: "Before breakfast and lunch",
          treatmentName: "1. La Roche-Posay Effaclar Duo Cream",
          treatmentTime: "morning and evening",
        ),
      ),
      Services(
        image: 'assets/icons/noun-corona.svg',
        color: const Color(0xffF2E3E9),
        title: S.of(context).ai,
        content: (BuildContext context) => AiScanning(),
      ),
    ];

/// Upcoming Appointments

class Appointments {
  final String date;
  final String time;
  final String title;
  final String subTitle;
  final Color color;

  Appointments({
    required this.color,
    required this.date,
    required this.time,
    required this.title,
    required this.subTitle,
  });
}

// Upcoming Appointments List OF DATA

List<Appointments> upcomingAppointmentsList = [
  Appointments(
    date: "12\nTue",
    time: DateFormat('hh:mm a').format(DateTime.now()),
    title: "Dr. Mim Akhter",
    subTitle: "Depression",
    color: const Color(0xff1C6BA4),
  ),
  Appointments(
    date: "12\nTue",
    time: DateFormat('hh:mm a').format(DateTime.now()),
    title: "Dr. Mim Akhter",
    subTitle: "Depression",
    color: const Color(0xff1C6BA4),
  ),
];
