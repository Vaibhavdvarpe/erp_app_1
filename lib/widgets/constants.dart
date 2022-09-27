import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Api {
  static String docURL = "https://hospione.com/demo/api/docapi/";
  static String patientURL = "https://hospione.com/demo/api/patientapi/";
  static String patientImageUrl = "https://hospione.com/demo/uploads/frontend/";
  static String speciality = "speciality";
  static String specialityId = "speciality_id";
  static String specialityDetails = "speciality_details";
  static String cities = "cities";
  static String disease = "disease";
  static String diseaseDetails = "disease_details";
  static String register = "register";
  static String surgeonEnquiry = "surgeon_enquiry";
  static String dashboard = "dashboard";
  static String docAppointmentList = "docappointmentlist";
  static String docwiseTicketList = "docwise_ticket_list";
  static String surAppointList = "sur_appoint_list";
  static String docwisePatientList = "docwise_patient_list";
  static String viewTicket = "view_ticket";
  static String myTickets = "my_tickets";
  static String myProfile = "patient_profile";
  static String ticketDetail = "ticket_detail";
  static String checkDoctor = "check_doctor";
  static String checkPatient = "check_patient";
  static String otpVerify = "otp_verify";
  static String specialityFAQ = "speciality_faq";
  static String diseaseFAQ = "disease_faq";
  static String updateProfile = "updateProfile";
  static final box = GetStorage();
  static String docReqEditInfo = "request_edit_info";
  static String docAllAppointments = "getallappointments";
  static String docAvailabilityStatus = "update_availibilty_status";
}

class C {
  static const appGreen = Color.fromRGBO(35, 133, 59, 1);
  static const loginimageColor = Color.fromARGB(228, 229, 248, 248);
  static const tealGreen = Color.fromARGB(255, 0, 165, 158);
  static const white = Colors.white;
  static const greyDark = Colors.grey;
  static const orange = Colors.orange;
  static const cyan = Colors.cyan;
  static const pink = Colors.pink;
  static const red = Colors.red;
  static const blue = Color.fromARGB(255, 19, 27, 66);
  static const lightBlue = Color.fromARGB(255, 224, 251, 255);
  static const black = Colors.black;
  static const grey = Color.fromARGB(255, 242, 244, 250);
  static const purple = Color.fromARGB(255, 19, 27, 66);
  static Transition rTol = Transition.rightToLeft;
  static var font = GoogleFonts.poppins().fontFamily;
}
