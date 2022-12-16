
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../Utility/PopUpMenuCommonStringClass.dart';

class TrackGrievance extends StatefulWidget {
  const TrackGrievance({Key? key}) : super(key: key);

  @override
  State<TrackGrievance> createState() => _TrackGrievanceState();
}

class _TrackGrievanceState extends State<TrackGrievance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
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
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(

                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      const Text('Track Grievance',
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat-Regular'))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 17,
                    right: 17,
                    top: MediaQuery.of(context).size.height / 11,
                    bottom: 35),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                    padding: const EdgeInsets.only(left: 16.0, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Enter Grievance No.',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat-Regular')),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: SizedBox(
                                height: 40,
                                child: TextFormField(
                                  cursorHeight: 20,
                                  cursorColor: const Color(0xFFb83058),
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat-Medium',
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFb83058))),
                                      hintText: "OS/20221007-1",
                                      hintStyle: const TextStyle(
                                          height: 1,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black26,
                                          fontFamily: 'Montserrat-Medium',
                                          fontStyle: FontStyle.normal),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.black12, width: 4))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: const Color(0xFFb83058),
                                  child:PopupMenuButton(
                                    onSelected: (value) {
                                      setState(() {
                                        value = value;
                                      });
                                    },
                                    itemBuilder: (context){
                                      return
                                        list.map((popupItem choice) {
                                          return PopupMenuItem(
                                              value: choice,
                                              child: Column(
                                                children: [
                                                  Text(choice.name,style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black54,
                                                    fontFamily: 'Montserrat-SemiBold',
                                                    //fontStyle: FontStyle.normal
                                                  ),),
                                                  Divider(
                                                    thickness: 2,
                                                    color: Colors.grey.shade100,
                                                  )
                                                ],
                                              )
                                          );
                                        }).toList();
                                    },
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset("assets/images/filter.svg",
                                          height: 20),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          height: 40,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Get.toNamed("/TrackGrievanceSearch");
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
                                //fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat-Regular'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.65,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (BuildContext context,
                                      int index) =>
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height / 5,
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
                                                  2.2,
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
                                                              FontWeight.w300,
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
                                                  top:10),
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
                                                  children: [

                                                    Row(
                                                      children:  [
                                                        const Text("Grievance Id",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black38,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Montserrat-Regular')),
                                                        const Spacer(),
                                                        GestureDetector(
                                                          onTap: (){
                                                            Get.toNamed("/TrackGrievanceViewPage");
                                                          },
                                                          child: const Text(
                                                            "View",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Montserrat-Regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                          fontSize: 15,

                                                          color: Colors.black,
                                                          fontFamily:
                                                              'Montserrat-Regular',
                                                          fontStyle: FontStyle
                                                              .normal),
                                                    ),
                                                    const SizedBox(
                                                      height: 9,
                                                    ),
                                                    const Text("Department",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .black38,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            fontFamily:
                                                                'Montserrat-Regular')),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    const Text(
                                                      "Municipal Corporation",
                                                      style: TextStyle(
                                                          height: 1,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontStyle: FontStyle
                                                              .normal),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    const Text("Status",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .black38,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            fontFamily:
                                                                'Montserrat-Regular')),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      "Resolved",
                                                      style: TextStyle(
                                                          height: 1,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors
                                                              .greenAccent
                                                              .shade400,
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

            ],
          ),
        ),
      ),
    ));
  }
}
