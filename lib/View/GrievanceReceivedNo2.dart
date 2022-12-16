import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Utility/List.dart';



class GrievanceReceivedNo2 extends StatefulWidget {
  const GrievanceReceivedNo2({Key? key}) : super(key: key);

  @override
  State<GrievanceReceivedNo2> createState() => _GrievanceReceivedNo2State();
}

class _GrievanceReceivedNo2State extends State<GrievanceReceivedNo2> {

  FilePickerResult? result;
  String fileName = '';
  PlatformFile? pickedfile;
  bool isLoading = false;
  // File? fileToDisplay;

  void pickFile() async {
    try{
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png','jpg','jpeg'],
        allowMultiple: false,
      );

      if(result != null){
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        // fileToDisplay = File(pickedfile!.path.toString());

        print('File name $fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.6,
                    color: const Color(0xFFb83058),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                        ),
                        const Text(
                          "Grievance Recieved",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1.22,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 30),
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height/0.9,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                1.2,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // height: MediaQuery.of(context).size.height/12.2,
                                                  height: 55,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: const Color(0xFFb83058),
                                                  child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 15.0),
                                                      child: Text(
                                                        "Grievance No.: OS/20221007-1",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      const SizedBox(height: 5),
                                                      const Text(
                                                        "Please select the Department and Office to forward the Grievance?",
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w100,
                                                          fontSize: 13.5,
                                                        ),
                                                      ),

                                                      SizedBox(height: 20),
                                                      Text(
                                                        "Select Administration/ Department type",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey.shade700),
                                                      ),
                                                      const SizedBox(height: 7),
                                                      DropdownButtonFormField<String>(
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down_outlined),
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(8)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey.shade400))),
                                                        value: selectedpartial1,
                                                        items: partialList1.map(
                                                                (partialList1) =>
                                                                DropdownMenuItem<String>(
                                                                  value: partialList1,
                                                                  child: Text(partialList1,
                                                                      style: const TextStyle(
                                                                          fontSize: 13)),
                                                                )).toList(),
                                                        onChanged: (partialList1) =>
                                                            setState(() => selectedpartial1 =
                                                                partialList1),
                                                        menuMaxHeight: 300,
                                                      ),
                                                      const SizedBox(height: 20),
                                                      Text(
                                                        "Office",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey.shade700),
                                                      ),
                                                      const SizedBox(height: 7),
                                                      DropdownButtonFormField<String>(
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down_outlined),
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(8)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey.shade400))),
                                                        value: selectedpartial2,
                                                        items: partialList2.map(
                                                                (partialList2) =>
                                                                DropdownMenuItem<String>(
                                                                  value: partialList2,
                                                                  child: Text(partialList2,
                                                                      style: const TextStyle(
                                                                          fontSize: 13)),
                                                                )).toList(),
                                                        onChanged: (partialList2) =>
                                                            setState(() => selectedpartial2 =
                                                                partialList2),
                                                        menuMaxHeight: 300,
                                                      ),
                                                      const SizedBox(height: 20),
                                                      Text(
                                                        "Nature Of Grievance",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey.shade700),
                                                      ),
                                                      const SizedBox(height: 7),
                                                      DropdownButtonFormField<String>(
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down_outlined),
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(8)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey.shade400))),
                                                        value: selectednaturegrievance,
                                                        items: naturegrievanceList.map(
                                                                (naturegrievanceList) =>
                                                                DropdownMenuItem<String>(
                                                                  value: naturegrievanceList,
                                                                  child: Text(naturegrievanceList,
                                                                      style: const TextStyle(
                                                                          fontSize: 13)),
                                                                )).toList(),
                                                        onChanged: (naturegrievanceList) =>
                                                            setState(() => selectednaturegrievance =
                                                                naturegrievanceList),
                                                        menuMaxHeight: 300,
                                                      ),
                                                      const SizedBox(height: 20),
                                                      Text(
                                                        "Remark",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey.shade700),
                                                      ),
                                                      const SizedBox(height: 7),
                                                      TextFormField(
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(200),
                                                        ],
                                                        maxLines: 6,
                                                        cursorColor: Colors.grey,
                                                        decoration: InputDecoration(
                                                            hintText: 'Type here....',
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(8)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color:
                                                                    Colors.grey.shade400))),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      //Upload Image
                                                      Text(
                                                        "Upload Image/ Document",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey.shade700),
                                                      ),
                                                      const SizedBox(height: 7),
                                                      Container(
                                                        height: 55,
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                            border:
                                                            Border.all(color: Colors.grey),
                                                            borderRadius:
                                                            BorderRadius.circular(8)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(top: 8,right: 8,bottom: 8),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              const SizedBox(width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  fileName.isEmpty? "No File Choosen" :"$fileName",
                                                                  style: const TextStyle(fontSize: 12),
                                                                ),
                                                              ),
                                                              MaterialButton(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(8),
                                                                  ),
                                                                  color: Colors.grey.shade200,
                                                                  onPressed: () {
                                                                    pickFile();
                                                                  },
                                                                  child: const Text("Choose File"))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets.all(5.0),
                                                        child: Text(
                                                          "Files must be less than 2 MB. \nAllowed file types: png jpg jpeg.",
                                                          style: TextStyle(color: Colors.grey,fontSize: 11),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 20),


                                                      const SizedBox(height: 20),
                                                      Center(
                                                        child: MaterialButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(8)),
                                                          minWidth: 280,
                                                          height: 50,
                                                          color: const Color(0xFFb83058),
                                                          onPressed: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (ctx) => AlertDialog(shape: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(20)
                                                              ),
                                                                title: const Image(image: AssetImage('assets/images/blue.png'),height: 50,width: 50,),
                                                                content: const Text("Are you sure you want to forward the Grievance?"),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      Get.toNamed("/DashBoardScreen");
                                                                    },
                                                                    child: Column(
                                                                      children: [
                                                                        MaterialButton(
                                                                          onPressed: () {
                                                                            showDialog(
                                                                              context: context,
                                                                              builder: (ctx) => AlertDialog(shape: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(20)
                                                                              ),
                                                                                title: SvgPicture.asset('assets/images/submit.svg',height: 60,width: 60),
                                                                                content: const Text("Grievance No.: OS/20221007-1\nhas been successfully forwarded to\nDepartment  : MIDC\nOffice               : MIDC Chakan"),
                                                                                actions: <Widget>[
                                                                                  MaterialButton(
                                                                                    shape: RoundedRectangleBorder(
                                                                                        borderRadius:
                                                                                        BorderRadius.circular(8)),
                                                                                    minWidth: 280,
                                                                                    height: 50,
                                                                                    color: const Color(0xFFb83058),
                                                                                    onPressed: () {
                                                                                      Get.toNamed("/GrievanceReceivedScreen");
                                                                                    },
                                                                                    child: const Text(
                                                                                      "Okay",
                                                                                      style: TextStyle(
                                                                                          color: Colors.white,
                                                                                          fontSize: 18),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );

                                                                          },
                                                                          height: 45,
                                                                          minWidth: double.infinity,
                                                                          textColor: Colors.green,
                                                                          shape: RoundedRectangleBorder(side: const BorderSide(
                                                                              color: Colors.green,
                                                                              width: 1,
                                                                              style: BorderStyle.solid
                                                                          ), borderRadius: BorderRadius.circular(10)),

                                                                          child: const Text('Yes', style: TextStyle(
                                                                              fontSize: 20
                                                                          )
                                                                          ),
                                                                        ),
                                                                        SizedBox(height: 10),
                                                                        MaterialButton(
                                                                          onPressed: (){
                                                                            Get.back();
                                                                          },
                                                                          height: 45,
                                                                          minWidth: double.infinity,
                                                                          textColor: Color(0xFFb83058),
                                                                          shape: RoundedRectangleBorder(side: const BorderSide(
                                                                              color: Color(0xFFb83058),
                                                                              width: 1,
                                                                              style: BorderStyle.solid
                                                                          ), borderRadius: BorderRadius.circular(10)),

                                                                          child: const Text('No', style: TextStyle(
                                                                              fontSize: 20
                                                                          )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          child: const Text(
                                                            "Forward",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                      // const SizedBox(height: 20),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
