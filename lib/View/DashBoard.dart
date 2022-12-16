import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utility/DashboardCommonWidget.dart';
import '../Utility/PieChartUtility.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAccountsDrawerHeader(

                    otherAccountsPictures: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: SvgPicture.asset(
                          'assets/images/Cross.svg',
                          height: 20,
                        ),
                      ),
                    ],

                    decoration: BoxDecoration(color: Colors.white),


                    accountName: Text(
                      'Mukul Joshi',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          // fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat-Regular'),
                    ),
                    accountEmail: Text("sundar@appmaking.co"),
                  ),


                  InkWell(
                    onTap: () {
                      Get.toNamed("/PostGrievanceScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/images/Post Grievance Grey.svg',
                        section: 'Post Grievance'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/TrackGrievance");
                    },
                    child: drawerBox(
                        icon: 'assets/images/Track Grievance Grey.svg',
                        section: 'Track Grievance'),
                  ),
                  GestureDetector(
                    onTap:(){
                      Get.toNamed("/GrievanceReceivedScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/images/feedback Grey.svg',
                        section: 'Received Grievance'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/ReportScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/images/feedback Grey.svg',
                        section: 'Reports'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/ContactUsScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/images/Contact Us Grey.svg',
                        section: 'Contact Us'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/FAQ");
                    },
                    child: drawerBox(
                        icon: 'assets/images/FAQ\'s.svg', section: 'FAQ\'S'),
                  ),
                  drawerBox(
                      icon: 'assets/images/settings.svg', section: 'Setting'),
                  drawerBox(
                      icon: 'assets/images/logout Grey.svg', section: 'Logout'),
                ],
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: const Color(0xFFb83058),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            _key.currentState!.openDrawer();
                          },
                          icon: SvgPicture.asset('assets/images/menu.svg',
                              height: 18, color: Colors.white)),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.toNamed("/NotificationScreen");
                          },
                          icon: SvgPicture.asset(
                              'assets/images/Notification.svg',
                              height: 24,
                              color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            Get.toNamed("/ProfileScreen");
                          },
                          icon: SvgPicture.asset(
                            'assets/images/Profile.svg',
                            color: Colors.white,
                            height: 25,
                          )),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 17.0),
                  child: Text(
                    "Hello, Mukul Joshi",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Medium",
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 6.6,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Grievance Status",
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: "Montserrat-SemiBold",
                                fontSize: 15)),
                        const Spacer(),
                        Text(currentDate,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat-SemiBold",
                                fontSize: 14)),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: Color(0xFFb83058),
                        )
                      ],
                    ),
                    SizedBox(
                      height:25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/4.6,

                      child: PieChart(
                        PieChartData(
                          borderData: FlBorderData(
                            show: true,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius:70,
                          sections: showingSections(),

                        ),
                      ),
                    ),
                    SizedBox(height:35,),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.27,

                      child: Column(
                        children: [
                          Row(
                            children: [ Container(
                              height: 14,
                              width: 14,
                              color: Color(0xFF81D4FA),
                            ),
                              SizedBox(width: 18,),
                              Text("Open",
                                style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"),),
                              Spacer(),
                              Text("35%",style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"))
                            ],

                          ),
                          Row(
                            children: [ Container(
                                height: 14,
                                width: 14,
                                color:  Color(0xFFFBC02D)
                            ),
                              SizedBox(width: 18,),
                              Text("Accepted",
                                style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"),),
                              Spacer(),
                              Text("15%",style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"))
                            ],

                          ),
                          Row(
                            children: [ Container(
                              height: 14,
                              width: 14,
                              color:Color(0xFFAED581),
                            ),
                              SizedBox(width: 18,),
                              Text("Resolved", style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"),),
                              Spacer(),
                              Text(" 20%",style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"))
                            ],

                          ),
                          Row(
                            children: [ Container(
                                height: 14,
                                width: 14,
                                color:Color(0xFFB388FF)
                            ),
                              SizedBox(width: 18,),
                              Text("Partially Resolved", style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"),),
                              Spacer(),
                              Text("15%",style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"))
                            ],

                          ),
                          Row(
                            children: [ Container(
                              height: 14,
                              width: 14,
                              color: Colors.red.shade400,
                            ),
                              SizedBox(width: 18,),
                              Text("Rejected",style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium")),
                              Spacer(),
                              Text("10%",style: TextStyle(fontSize: 15,fontFamily: "Montserrat-Medium"))
                            ],

                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 1.60,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  color: Color(0xFFb83058),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: GridView.count(
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: 60,
                    top: 15,
                  ),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 30,
                  clipBehavior: Clip.hardEdge,
                  physics: const ScrollPhysics(),
                  //childAspectRatio: 1.10,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/PostGrievanceScreen");
                      },
                      child: dashboardGridContainer(context,
                          containerColor: Colors.yellow.shade100),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/GrievanceReceivedScreen");
                      },
                      child: dashboardGridContainer(context,
                          imageIconPath: 'assets/images/Track Grievance.svg',
                          imageIconText: 'Received \nGrievance',
                          containerColor: Colors.greenAccent.shade100),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/ReportScreen");
                      },
                      child: dashboardGridContainer(context,
                          imageIconPath: 'assets/images/Post Grievance.svg',
                          imageIconText: '\nReports',
                          containerColor: Colors.deepPurple.shade100),
                    ),
                    GestureDetector(

                      onTap: () {
                        Get.toNamed("/TrackGrievance");
                      },
                      child: dashboardGridContainer(context,
                          imageIconPath: 'assets/images/Notification.svg',
                          imageIconText: 'Track \nGrievance',
                          containerColor: Colors.brown.shade100),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/3.4,left:MediaQuery.of(context).size.width/2.35 ),
            child: Column(
              children: [
                Text("11200",style: TextStyle(color: Colors.cyan,fontSize: 25,),),
                Text("Total",style: TextStyle(color: Colors.black,fontSize: 16),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
