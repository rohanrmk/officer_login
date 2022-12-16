

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utility/grievance_list_location.dart';

class PostGrievanceScreen extends StatefulWidget {
  const PostGrievanceScreen({Key? key}) : super(key: key);

  @override
  State<PostGrievanceScreen> createState() => _PostGrievanceScreenState();
}

class _PostGrievanceScreenState extends State<PostGrievanceScreen> {



  FilePickerResult? result;
  String fileName = '';
  PlatformFile? pickedfile;
  bool isLoading = false;

  // File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        // fileToDisplay = File(pickedfile!.path.toString());

        print('File name $fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  String self = 'Self';
  String other = 'Others';
  String groupVal = 'Self';


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
                    height: MediaQuery.of(context).size.height / 0.1,
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
                          "Post Grievance",
                          style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.28,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1.28,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20,top: 15),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 1.2,

                                                  child: Radio(
                                                      activeColor: const Color(0xFFb83058),
                                                      value: self,
                                                      groupValue: groupVal,
                                                      onChanged: (value){
                                                        setState(() {
                                                          groupVal = value.toString();
                                                        });
                                                      }
                                                  ),
                                                ),
                                                Text(
                                                  self,
                                                  style: TextStyle(fontFamily: 'Montserrat-Regular',fontSize: 17),
                                                ),
                                              ],
                                            ),

                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 1.2,
                                                  child: Radio(
                                                      activeColor: const Color(0xFFb83058),
                                                      value: other,
                                                      groupValue: groupVal,
                                                      onChanged: (value){
                                                        setState(() {
                                                          groupVal = value.toString();
                                                        });
                                                      }
                                                  ),
                                                ),
                                                Text(
                                                  other,
                                                  style: TextStyle(fontFamily: 'Montserrat-Regular',fontSize: 17),
                                                ),
                                              ],
                                            )


                                          ],
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height/1.5,
                                           decoration: BoxDecoration(
                                           ),
                                           child: groupVal == self ?SingleChildScrollView(
                                             scrollDirection: Axis.vertical,
                                             child: Padding(
                                               padding: const EdgeInsets.only(top: 20),
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'District',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),
                                                   TextFormField(
                                                     enabled: false,
                                                     cursorColor: Colors.grey,
                                                     decoration: InputDecoration(
                                                         isDense: true,
                                                         hintText: 'Osmanabad',
                                                         hintStyle: const TextStyle(
                                                             color: Colors.black87,
                                                             fontWeight: FontWeight.w500,
                                                             fontFamily: 'Montserrat-Regular'),
                                                         border: OutlineInputBorder(
                                                             borderRadius:
                                                             BorderRadius.circular(8)),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderSide: BorderSide(
                                                                 color: Colors
                                                                     .grey.shade400))),
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Taluka
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Taluka',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem,
                                                     items: posttaluka
                                                         .map((posttaluka) =>
                                                         DropdownMenuItem<String>(
                                                           value: posttaluka,
                                                           child: Text(posttaluka,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (posttaluka) => setState(
                                                             () => selectedItem = posttaluka),
                                                     menuMaxHeight: 300,
                                                   ),
                                                   const SizedBox(height: 15),
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Village',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),

                                                   //Village
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
                                                     value: selectedItem1,
                                                     items: postvillage
                                                         .map((postvillage) =>
                                                         DropdownMenuItem<String>(
                                                           value: postvillage,
                                                           child: Text(postvillage,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postvillage) => setState(
                                                             () =>
                                                         selectedItem1 = postvillage),
                                                     menuMaxHeight: 300,
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Department
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Department',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem2,
                                                     items: postdepartment
                                                         .map((postdepartment) =>
                                                         DropdownMenuItem<String>(
                                                           value: postdepartment,
                                                           child: Text(postdepartment,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postdepartment) =>
                                                         setState(() => selectedItem2 =
                                                             postdepartment),
                                                     menuMaxHeight: 300,
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Office
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Office',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem3,
                                                     items: postoffice
                                                         .map((postoffice) =>
                                                         DropdownMenuItem<String>(
                                                           value: postoffice,
                                                           child: Text(postoffice,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postoffice) => setState(
                                                             () => selectedItem3 = postoffice),
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Grievance
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Nature of Grievance',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem4,
                                                     items: postgrievance
                                                         .map((postgrievance) =>
                                                         DropdownMenuItem<String>(
                                                           value: postgrievance,
                                                           child: Text(postgrievance,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postgrievance) =>
                                                         setState(() => selectedItem4 =
                                                             postgrievance),
                                                   ),
                                                   const SizedBox(height: 15),
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Greivance Details',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),

                                                   //Type here
                                                   TextFormField(
                                                     inputFormatters: [
                                                       LengthLimitingTextInputFormatter(
                                                           200),
                                                     ],
                                                     maxLines: 4,
                                                     cursorColor: Colors.grey,
                                                     decoration: InputDecoration(
                                                         hintText: 'Type Here',
                                                         border: OutlineInputBorder(
                                                             borderRadius:
                                                             BorderRadius.circular(8)),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderSide: BorderSide(
                                                                 color: Colors
                                                                     .grey.shade400))),
                                                   ), //Grievance
                                                   const SizedBox(height: 15),

                                                   //Upload Image
                                                   Row(
                                                     mainAxisAlignment:
                                                     MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Text(
                                                         "Upload Image/ Document",
                                                         style: TextStyle(
                                                             fontSize: 14,
                                                             color: Colors.grey.shade700),
                                                       ),
                                                       const Text(
                                                         "(Optional)",
                                                         style: TextStyle(
                                                             fontSize: 10,
                                                             fontWeight: FontWeight.w300,
                                                             color: Colors.grey),
                                                       ),
                                                     ],
                                                   ),
                                                   const SizedBox(height: 7),
                                                   Container(
                                                     height: 55,
                                                     width:
                                                     MediaQuery.of(context).size.width,
                                                     decoration: BoxDecoration(
                                                         border: Border.all(
                                                             color: Colors.grey),
                                                         borderRadius:
                                                         BorderRadius.circular(8)),
                                                     child: Padding(
                                                       padding: const EdgeInsets.only(
                                                           top: 8, right: 8, bottom: 8),
                                                       child: Row(
                                                         mainAxisAlignment:
                                                         MainAxisAlignment.spaceEvenly,
                                                         children: [
                                                           const SizedBox(width: 5),
                                                           Expanded(
                                                             child: Text(
                                                               fileName.isEmpty
                                                                   ? "No File Choosen"
                                                                   : "$fileName",
                                                               style: const TextStyle(
                                                                   fontSize: 12),
                                                             ),
                                                           ),
                                                           MaterialButton(
                                                               shape:
                                                               RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 BorderRadius.circular(
                                                                     8),
                                                               ),
                                                               color: Colors.grey.shade200,
                                                               onPressed: () {
                                                                 pickFile();
                                                               },
                                                               child: const Text(
                                                                   "Choose File"))
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                                   const Padding(
                                                     padding: EdgeInsets.all(5.0),
                                                     child: Text(
                                                       "Files must be less than 2 MB. \n Allowed file types: png jpg jpeg.",
                                                       style: TextStyle(
                                                           color: Colors.grey,
                                                           fontSize: 11),
                                                     ),
                                                   ),
                                                   const SizedBox(height: 20),

                                                   //Submit Button
                                                   Center(
                                                     child: MaterialButton(
                                                       shape: RoundedRectangleBorder(
                                                           borderRadius:
                                                           BorderRadius.circular(8)),
                                                       minWidth: double.infinity,
                                                       height: 50,
                                                       color: const Color(0xFFb83058),
                                                       onPressed: () {},
                                                       child: const Text(
                                                         "Submit",
                                                         style: TextStyle(
                                                             color: Colors.white,
                                                             fontSize: 18),
                                                       ),
                                                     ),
                                                   ),
                                                   const SizedBox(height: 25),
                                                 ],
                                               ),
                                             ),
                                           ):SingleChildScrollView(
                                             scrollDirection: Axis.vertical,
                                             child: Padding(
                                               padding: const EdgeInsets.only(top: 20),
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Name',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),
                                                   TextFormField(
                                                     style:
                                                     const TextStyle(fontFamily: 'Montserrat-Regular', height: 1),
                                                     cursorColor: Colors.grey,
                                                     decoration: InputDecoration(
                                                       isDense: true,
                                                       hintText: 'Enter Name',
                                                       border: OutlineInputBorder(
                                                         borderRadius: BorderRadius.circular(8),
                                                       ),
                                                       focusedBorder: OutlineInputBorder(
                                                         borderSide: const BorderSide(
                                                             color: Color(0xFFb83058), width: 2.0),
                                                         borderRadius: BorderRadius.circular(8),
                                                       ),

                                                     ),
                                                   ),
                                                   const SizedBox(height: 15),
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Mobile',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),
                                                   TextFormField(
                                                     keyboardType:TextInputType.number,
                                                     style:
                                                     const TextStyle(fontFamily: 'Montserrat-Regular', height: 1),
                                                     cursorColor: Colors.grey,
                                                     decoration: InputDecoration(
                                                       isDense: true,
                                                       hintText: 'Enter Mobile',
                                                       border: OutlineInputBorder(
                                                         borderRadius: BorderRadius.circular(8),
                                                       ),
                                                       focusedBorder: OutlineInputBorder(
                                                         borderSide: const BorderSide(
                                                             color: Color(0xFFb83058), width: 2.0),
                                                         borderRadius: BorderRadius.circular(8),
                                                       ),

                                                     ),
                                                   ),
                                                   const SizedBox(height: 15),
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Address',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),
                                                   TextFormField(
                                                     style:
                                                     const TextStyle(fontFamily: 'Montserrat-Regular', height: 1),
                                                     cursorColor: Colors.grey,
                                                     decoration: InputDecoration(
                                                       isDense: true,
                                                       hintText: 'Enter Address',
                                                       border: OutlineInputBorder(
                                                         borderRadius: BorderRadius.circular(8),
                                                       ),
                                                       focusedBorder: OutlineInputBorder(
                                                         borderSide: const BorderSide(
                                                             color: Color(0xFFb83058), width: 2.0),
                                                         borderRadius: BorderRadius.circular(8),
                                                       ),

                                                     ),
                                                   ),
                                                   const SizedBox(height: 15),
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'District',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),
                                                   TextFormField(
                                                     enabled: false,
                                                     cursorColor: Colors.grey,
                                                     decoration: InputDecoration(
                                                         isDense: true,
                                                         hintText: 'Osmanabad',
                                                         hintStyle: const TextStyle(
                                                             color: Colors.black87,
                                                             fontWeight: FontWeight.w500,
                                                             fontFamily: 'Montserrat-Regular'),
                                                         border: OutlineInputBorder(
                                                             borderRadius:
                                                             BorderRadius.circular(8)),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderSide: BorderSide(
                                                                 color: Colors
                                                                     .grey.shade400))),
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Taluka
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Taluka',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem,
                                                     items: posttaluka
                                                         .map((posttaluka) =>
                                                         DropdownMenuItem<String>(
                                                           value: posttaluka,
                                                           child: Text(posttaluka,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (posttaluka) => setState(
                                                             () => selectedItem = posttaluka),
                                                     menuMaxHeight: 300,
                                                   ),
                                                   const SizedBox(height: 15),
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Village',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),

                                                   //Village
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
                                                     value: selectedItem1,
                                                     items: postvillage
                                                         .map((postvillage) =>
                                                         DropdownMenuItem<String>(
                                                           value: postvillage,
                                                           child: Text(postvillage,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postvillage) => setState(
                                                             () =>
                                                         selectedItem1 = postvillage),
                                                     menuMaxHeight: 300,
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Department
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Department',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem2,
                                                     items: postdepartment
                                                         .map((postdepartment) =>
                                                         DropdownMenuItem<String>(
                                                           value: postdepartment,
                                                           child: Text(postdepartment,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postdepartment) =>
                                                         setState(() => selectedItem2 =
                                                             postdepartment),
                                                     menuMaxHeight: 300,
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Office
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Office',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem3,
                                                     items: postoffice
                                                         .map((postoffice) =>
                                                         DropdownMenuItem<String>(
                                                           value: postoffice,
                                                           child: Text(postoffice,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postoffice) => setState(
                                                             () => selectedItem3 = postoffice),
                                                   ),
                                                   const SizedBox(height: 15),

                                                   //Grievance
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Nature of Grievance',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
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
                                                     value: selectedItem4,
                                                     items: postgrievance
                                                         .map((postgrievance) =>
                                                         DropdownMenuItem<String>(
                                                           value: postgrievance,
                                                           child: Text(postgrievance,
                                                               style: const TextStyle(
                                                                   fontSize: 17)),
                                                         ))
                                                         .toList(),
                                                     onChanged: (postgrievance) =>
                                                         setState(() => selectedItem4 =
                                                             postgrievance),
                                                   ),
                                                   const SizedBox(height: 15),
                                                   RichText(
                                                     text: const TextSpan(
                                                         text: 'Greivance Details',
                                                         style: TextStyle(
                                                             color: Colors.grey,
                                                             fontSize: 16,
                                                             fontWeight: FontWeight.w300),
                                                         children: <TextSpan>[
                                                           TextSpan(
                                                             text: ' * ',
                                                             style: TextStyle(
                                                                 color: Color(0xFFb83058),
                                                                 fontSize: 18),
                                                           )
                                                         ]),
                                                   ),
                                                   const SizedBox(height: 7),

                                                   //Type here
                                                   TextFormField(
                                                     inputFormatters: [
                                                       LengthLimitingTextInputFormatter(
                                                           200),
                                                     ],
                                                     maxLines: 4,
                                                     cursorColor: Colors.grey,
                                                     decoration: InputDecoration(
                                                         hintText: 'Type Here',
                                                         border: OutlineInputBorder(
                                                             borderRadius:
                                                             BorderRadius.circular(8)),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderSide: BorderSide(
                                                                 color: Colors
                                                                     .grey.shade400))),
                                                   ), //Grievance
                                                   const SizedBox(height: 15),

                                                   //Upload Image
                                                   Row(
                                                     mainAxisAlignment:
                                                     MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Text(
                                                         "Upload Image/ Document",
                                                         style: TextStyle(
                                                             fontSize: 14,
                                                             color: Colors.grey.shade700),
                                                       ),
                                                       const Text(
                                                         "(Optional)",
                                                         style: TextStyle(
                                                             fontSize: 10,
                                                             fontWeight: FontWeight.w300,
                                                             color: Colors.grey),
                                                       ),
                                                     ],
                                                   ),
                                                   const SizedBox(height: 7),
                                                   Container(
                                                     height: 55,
                                                     width:
                                                     MediaQuery.of(context).size.width,
                                                     decoration: BoxDecoration(
                                                         border: Border.all(
                                                             color: Colors.grey),
                                                         borderRadius:
                                                         BorderRadius.circular(8)),
                                                     child: Padding(
                                                       padding: const EdgeInsets.only(
                                                           top: 8, right: 8, bottom: 8),
                                                       child: Row(
                                                         mainAxisAlignment:
                                                         MainAxisAlignment.spaceEvenly,
                                                         children: [
                                                           const SizedBox(width: 5),
                                                           Expanded(
                                                             child: Text(
                                                               fileName.isEmpty
                                                                   ? "No File Choosen"
                                                                   : "$fileName",
                                                               style: const TextStyle(
                                                                   fontSize: 12),
                                                             ),
                                                           ),
                                                           MaterialButton(
                                                               shape:
                                                               RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 BorderRadius.circular(
                                                                     8),
                                                               ),
                                                               color: Colors.grey.shade200,
                                                               onPressed: () {
                                                                 pickFile();
                                                               },
                                                               child: const Text(
                                                                   "Choose File"))
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                                   const Padding(
                                                     padding: EdgeInsets.all(5.0),
                                                     child: Text(
                                                       "Files must be less than 2 MB. \n Allowed file types: png jpg jpeg.",
                                                       style: TextStyle(
                                                           color: Colors.grey,
                                                           fontSize: 11),
                                                     ),
                                                   ),
                                                   const SizedBox(height: 20),

                                                   //Submit Button
                                                   Center(
                                                     child: MaterialButton(
                                                       shape: RoundedRectangleBorder(
                                                           borderRadius:
                                                           BorderRadius.circular(8)),
                                                       minWidth: double.infinity,
                                                       height: 50,
                                                       color: const Color(0xFFb83058),
                                                       onPressed: () {
                                                         Get.toNamed('/DashBoardScreen');
                                                       },
                                                       child: const Text(
                                                         "Submit",
                                                         style: TextStyle(
                                                             color: Colors.white,
                                                             fontSize: 18),
                                                       ),
                                                     ),
                                                   ),
                                                   const SizedBox(height: 25),
                                                 ],
                                               ),
                                             ),
                                           ),
                                          ),
                                        ),
                                        //District

                                      ],
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
                  // Container(
                  //   height: MediaQuery
                  //       .of(context)
                  //       .size
                  //       .height,
                  //   alignment: Alignment.bottomCenter,
                  //   padding: const EdgeInsets.only(bottom: 35),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: const [
                  //       Text(
                  //         "Powered By : ",
                  //         style: TextStyle(
                  //             fontFamily: 'Montserrat-Regular',
                  //             color: Colors.black45,
                  //             fontWeight: FontWeight.w300,
                  //             fontSize: 17),
                  //       ),
                  //       SizedBox(
                  //         height: 25,
                  //         child: Image(
                  //             image: AssetImage(
                  //               'assets/img.png',
                  //             )),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
