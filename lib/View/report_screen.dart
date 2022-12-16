import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utility/common_widgets.dart';


class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFb83058),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
            child: Container(
              decoration: const BoxDecoration(
                color:Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/20,
            left: MediaQuery.of(context).size.width/21,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    const Text("Reports",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,

                            fontFamily: 'Montserrat-Regular'))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
              top: MediaQuery.of(context).size.height /10,
            ),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.30,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        // blurStyle:BlurStyle.outer,
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: const Offset(0, 5)
                    )
                  ],
                ),
                child:Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 25),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: MediaQuery.of(context).size.width/16,
                    mainAxisSpacing: MediaQuery.of(context).size.width/9,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.toNamed('/department');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0XffD6E4FF), imageIconText: 'Department\nwise Reports')),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed('/office');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffD0F1F2),imageIconText: 'Office \nwise Reports')),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed('/taluka');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffEDD6FF),imageIconText: 'Taluka \nwise Reports')),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed('/pendancy');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffF6C1D1),imageIconText: 'Pendency\nStatus')),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed('/report');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffAFE4FF),imageIconText: 'Satisfied/\nUnsatisfied\nReports')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,
                right: MediaQuery.of(context).size.width/2,
                top: MediaQuery.of(context).size.height/4.8
            ),
            child: reportsIconContainer(shadowColor: const Color(0xFFc8d5ee)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/3,
                right: MediaQuery.of(context).size.width/25,
                top: MediaQuery.of(context).size.height/4.8
            ),
            child: reportsIconContainer(shadowColor: const Color(0XFFc2e1e2)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/3,
                right: MediaQuery.of(context).size.width/25,
                top: MediaQuery.of(context).size.height/2.49
            ),
            child: reportsIconContainer(shadowColor: const Color(0XFFe6b4c3)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,
                right: MediaQuery.of(context).size.width/2,
                top: MediaQuery.of(context).size.height/2.49
            ),
            child: reportsIconContainer(shadowColor: const Color(0xFFddc8ee)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,
                right: MediaQuery.of(context).size.width/2,
                top: MediaQuery.of(context).size.height/1.68
            ),
            child: reportsIconContainer(shadowColor: const Color(0XFFa3d5ee)),
          ),
          /*         Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/4.5,
                right: MediaQuery.of(context).size.width/3.5,
                top: MediaQuery.of(context).size.height/6
            ),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.width/4.2,
              mainAxisSpacing: MediaQuery.of(context).size.width/3.5,
              children: [
                ReportsIconContainer(shadowColor: const Color(0xFFc8d5ee)),
                ReportsIconContainer(shadowColor: const Color(0XFFc2e1e2)),
                ReportsIconContainer(shadowColor: const Color(0xFFddc8ee)),
                ReportsIconContainer(shadowColor: const Color(0XFFe6b4c3)),
                ReportsIconContainer(shadowColor: const Color(0XFFa3d5ee)),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
