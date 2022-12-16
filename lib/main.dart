import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'View/ContactUs.dart';
import 'View/DashBoard.dart';

import 'View/Department Table.dart';
import 'View/Grievance PartialResolved.dart';
import 'View/Grievance Resolved.dart';
import 'View/GrievanceReceived2.dart';
import 'View/GrievanceReceivedNo.dart';
import 'View/GrievanceReceivedNo2.dart';
import 'View/LanguagePage.dart';
import 'View/LoginAndSignUp.dart';
import 'View/LoginPage.dart';
import 'View/NotificationScreen.dart';
import 'View/OTPTabbar.dart';
import 'View/Office Table.dart';
import 'View/Pendancy Table.dart';
import 'View/ProfileScreen.dart';
import 'View/Report Table.dart';
import 'View/Splash_Screen.dart';
import 'View/Taluka Table.dart';
import 'View/TrackGrievance.dart';
import 'View/TrackGrievanceSearch.dart';
import 'View/TrackGrievanceViewPage.dart';
import 'View/grievance_received.dart';
import 'View/post_grievance.dart';
import 'View/report_screen.dart';


void main() {
  /// to off the screen landscape mode

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ///Provide same statusBar Color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFb83058), // status bar color
  ));

  runApp( GetMaterialApp(

    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: "Montserrat-Regular",
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor:Color(0xFFb83058),
        selectionColor: Color(0xFFb83058),
        selectionHandleColor: Color(0xFFb83058),
      ),
    ),

    initialRoute: '/',
    getPages: [



      GetPage(name: '/', page: () => SplashScreen()),
      GetPage(name: '/language', page: () => ChooseLanguage()),
      GetPage(name: '/loginAndSignUp', page: ()=>const LoginAndSignUp()),
      GetPage(name: '/OTP_Page', page: ()=>const OTPTabPage()),
      GetPage(name: '/login', page: ()=>const LoginPage()),
      GetPage(name: '/DashBoardScreen', page: () => const Dashboard()),
      GetPage(name: '/NotificationScreen', page: () => const NotificationScreen()),
      GetPage(name: '/ProfileScreen', page: () => const ProfileScreen()),
      GetPage(name: '/TrackGrievance', page: () => const TrackGrievance()),
      GetPage(name: '/TrackGrievanceSearch', page: () => const TrackGrievanceSearch()),
      GetPage(name: '/TrackGrievanceViewPage', page: () => const TrackGrievanceViewPage()),
      GetPage(name: '/ReportScreen', page: () => const  ReportScreen()),
      GetPage(name: '/GrievanceReceivedScreen', page: () => const  GrievanceReceivedScreen()),
      GetPage(name: '/GrievanceReceived2()', page: () => GrievanceReceived2()),
      GetPage(name: '/Resolved', page: () => const Grievance_Recieved_Resolved()),
      GetPage(name: '/Partial', page: () => const Grievance_Recieved_PartialResolved()),
      GetPage(name: '/department', page: () => const Department()),
      GetPage(name: '/office', page: () => const Office()),
      GetPage(name: '/taluka', page: () => const Taluka()),
      GetPage(name: '/pendancy', page: () => const Pendancy()),
      GetPage(name: '/report', page: () => const Report()),
      GetPage(name: '/PostGrievanceScreen', page: () => const PostGrievanceScreen()),
      GetPage(name: '/ContactUsScreen', page: () => const ContactUsScreen()),
      GetPage(name: '/GrievanceReceivedNo', page: () => const GrievanceReceivedNo()),
      GetPage(name: '/GrievanceReceivedNo2', page: () => const GrievanceReceivedNo2()),

     /*



      GetPage(name: '/PostGrievance1', page: () => const PostGrievance1()),
      GetPage(name: '/SubmitFeedback', page: () => const SubmitFeedback()),

      GetPage(name: '/SubmitFeedback1', page: () => const SubmitFeedback1()),
      GetPage(name: '/SubmitFeedback2', page: () => const SubmitFeedback2()),
      GetPage(name: '/FAQ', page: () => const FAQ()),
      GetPage(name: '/ContactUsScreen', page: () => const ContactUsScreen()),


      // GetPage(name: '/', page: () => const SplashScreen()),*/




    ],


  ));

}


