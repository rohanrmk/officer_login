
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../Utility/PopUpMenuCommonStringClass.dart';

class TrackGrievanceViewPage extends StatefulWidget {
  const TrackGrievanceViewPage({Key? key}) : super(key: key);

  @override
  State<TrackGrievanceViewPage> createState() => _TrackGrievanceViewPageState();
}

class _TrackGrievanceViewPageState extends State<TrackGrievanceViewPage> {
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
                              height: 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height/1.69,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black12)
                              ),
                              child: ListView(
                                children: [
                                  const   SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("1",
                                        style: TextStyle(
                                            height: 1,
                                            fontSize:20,
                                            fontWeight:
                                            FontWeight.w400,
                                            color:Colors.black,
                                            fontFamily:
                                            'Montserrat-SemiBold',
                                            fontStyle: FontStyle
                                                .normal),),
                                      Text(
                                        "Accepted",
                                        style: TextStyle(
                                            height: 1,
                                            fontSize:17,
                                            fontWeight:
                                            FontWeight.w500,
                                            color:Colors.yellow.shade700,
                                            fontFamily:
                                            'Montserrat-SemiBold',
                                            fontStyle: FontStyle
                                                .normal),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 2,),
                                  Divider(
                                    thickness: 2,
                                    color:Colors.yellow.shade700 ,
                                  ),
                                  const SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:15.0,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        ///Grievance id
                                        const Text("Grievance Id",
                                            style: TextStyle(
                                                fontSize:15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const  SizedBox(height:7,),
                                        const Text(
                                          "OS/20221007-1",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),
                                        const  SizedBox(height:15,),


                                        ///Grievance Department

                                        const Text("Department",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:7,),
                                        const Text(
                                          "Municipal Corporation",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,

                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),
                                        const  SizedBox(height:20,),


                                        ///Office

                                        const Text("Office",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const  SizedBox(height:7,),
                                        const Text(
                                          "Osmanabad Municipal Corporation",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,


                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),
                                        const SizedBox(height:15,),

                                        ///Submission Date & Time

                                        const Text("Submission Date & Time",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const  SizedBox(height:7,),
                                        const Text(
                                          "12/10/2022   12:01 PM",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,

                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),
                                        const SizedBox(height:15,),


                                        ///Name
                                        const Text("Name",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:7,),
                                        const Text(
                                          "Mukul Joshi",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,


                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),
                                        const   SizedBox(height:15,),

                                        ///Mobile Number
                                        const Text("Mobile No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const  SizedBox(height:7,),
                                        const Text(
                                          "9308987639",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,

                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),const SizedBox(height:15,),

                                        ///Email
                                        const Text("Email",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const  SizedBox(height:7,),
                                        const Text(
                                          "mukuljoshi@gmail.com",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),const SizedBox(height:15,),

                                        ///District
                                        const Text("District",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:7,),
                                        const Text(
                                          "Osmanabad",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,

                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),const SizedBox(height:15,),
                                        ///Taluka
                                        const Text("Taluka",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:7,),
                                        const Text(
                                          "Tulajapur",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,

                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),const SizedBox(height:15,),
                                        ///Village
                                        const Text("Village ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:7,),
                                        const Text(
                                          "Andur",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,


                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),const SizedBox(height:15,),

                                        ///Nature of Grievance
                                        const Text("Nature of Grievance",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:7,),
                                        const Text(
                                          "Water Supply",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,

                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),
                                        const SizedBox(height:20,),

                                        ///Grievance Details
                                        const Text("Grievance Details",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:10,),
                                        const Text(
                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 17,

                                              color: Colors.black,
                                              fontFamily:
                                              'Montserrat-SemiBold',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),

                                        const SizedBox(height:20,),

                                        ///File Uploaded
                                        const Text("File Uploaded",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors
                                                    .black38,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 10),
                                          child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: const [
                                              Icon(Icons.picture_as_pdf_outlined,size: 25,color:  Color(0xFFb83058),),
                                              Spacer(),
                                              Text(
                                                "View File",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'Montserrat-Regular',
                                                  fontWeight:
                                                  FontWeight
                                                      .w500,
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
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height:30,),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
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




















