import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utility/PopUpMenuCommonStringClass.dart';
import '../utility/grievance_list_location.dart';

class GrievanceReceivedScreen extends StatefulWidget {
  const GrievanceReceivedScreen({Key? key}) : super(key: key);

  @override
  State<GrievanceReceivedScreen> createState() =>
      _GrievanceReceivedScreenState();
}

class _GrievanceReceivedScreenState extends State<GrievanceReceivedScreen> {
  String dateVal = 'Date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.8,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFb83058),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 21,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed("/DashBoardScreen");
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        const Text("Grievance Received",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                //fontWeight: FontWeight.w200,
                                fontFamily: 'Montserrat-SemiBold'))
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 8, bottom: 25),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 6,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DropdownButtonFormField<String>(
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 25,
                                  ),
                                  decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400))),
                                  value: selectedStatus,
                                  items: statusList
                                      .map((statusList) =>
                                          DropdownMenuItem<String>(
                                            value: statusList,
                                            child: Text(statusList,
                                                style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat-Regular')),
                                          ))
                                      .toList(),
                                  onChanged: (statusList) => setState(
                                      () => selectedStatus = statusList),
                                  menuMaxHeight: 300,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () async {
                                    DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2023),
                                      builder: (context, child) => Theme(
                                          data: Theme.of(context).copyWith(
                                              colorScheme:
                                                  const ColorScheme.light(
                                            primary: Color(0xFFb83058),
                                            onPrimary: Colors.white,
                                            onSurface: Color(0xFFb83058),
                                          )),
                                          child: child!),
                                    );

                                    setState(() {
                                      dateVal =
                                          '${date!.day}/ ${date.month}/${date.year}';
                                    });
                                  },
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.black26)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: Colors.black26,
                                            size: 25,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            dateVal,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Enter Grievance No.',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat-Regular')),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              cursorHeight: 20,
                              cursorColor: const Color(0xFFb83058),
                              style: const TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFb83058))),
                                  hintText: "OS/20221007-1",
                                  hintStyle: const TextStyle(
                                      height: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black26,
                                      fontFamily: 'Montserrat-Regular',
                                      fontStyle: FontStyle.normal),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Colors.black12, width: 4))),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            height: 45,
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                             // Get.toNamed("/GrievanceReceived2");
                            },
                            color: const Color(0xFFb83058),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: 'Montserrat-Regular'),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 1.9,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, bottom: 15),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.7,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFb83058),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(7),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    7))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text("${index + 1}",
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontFamily:
                                                                'Montserrat-Regular')),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text("22/10/2022",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            fontFamily:
                                                                'Montserrat-Regular')),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 7),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.3,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Text(
                                                              "Grievance ID",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black26,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Montserrat-Regular')),
                                                          const Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed("/GrievanceReceived2");
                                                            },
                                                            child: const Text(
                                                              "View",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Montserrat-Regular',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .transparent,
                                                                shadows: [
                                                                  Shadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              -5),
                                                                      color: Colors
                                                                          .blue)
                                                                ],
                                                                // Step 3 SEE HERE
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                decorationColor:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      const Text(
                                                        "OS/20221007-1",
                                                        style: TextStyle(
                                                            height: 1,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Montserrat-Regular',
                                                            fontStyle: FontStyle
                                                                .normal),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      const Text(
                                                          "Applicant Name",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Montserrat-Regular')),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      const Text(
                                                        "Kaushik Jaware",
                                                        style: TextStyle(
                                                            height: 1,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Montserrat-Regular',
                                                            fontStyle: FontStyle
                                                                .normal),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      const Text("Status",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Montserrat-Regular')),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      const Text(
                                                        "Open",
                                                        style: TextStyle(
                                                            height: 1,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0XFF028DD5),
                                                            fontFamily:
                                                                'Montserrat-Regular',
                                                            fontStyle: FontStyle
                                                                .normal),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height / 0.5,
              //   alignment: Alignment.bottomCenter,
              //   padding: const EdgeInsets.only(bottom: 6),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       Text(
              //         "Powered By : ",
              //         style: TextStyle(
              //             color: Colors.black45,
              //             fontSize: 16,
              //             fontWeight: FontWeight.w300,
              //             fontFamily: 'Montserrat-Regular'),
              //       ),
              //       Image(
              //         image: AssetImage("assets/img.png"),
              //         height: 20,
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
