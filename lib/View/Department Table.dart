import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utility/List.dart';


class Department extends StatefulWidget {
  const Department({Key? key}) : super(key: key);

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: MediaQuery.of(context).size.height / 2.07,
                  color: const Color(0xFFb83058),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new,size: 20),
                        color: Colors.white,
                      ),
                      const Text(
                        "Department wise Reports",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.26,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.26,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.white,
                              elevation: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 12),
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xFFD6D6D6),
                                          radius: 13,
                                          foregroundImage: AssetImage('assets/images/pdf.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 12.0,right: 12,left: 8),
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xFFD6D6D6),
                                          radius: 13,
                                          foregroundImage: AssetImage('assets/images/excel.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      'Department',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SizedBox(
                                      height: 50,
                                      child: DropdownButtonFormField<String>(
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
                                        value: selectedDepartment,
                                        items: DepartmentList.map(
                                            (DepartmentList) =>
                                                DropdownMenuItem<String>(
                                                  value: DepartmentList,
                                                  child: Text(DepartmentList,
                                                      style: const TextStyle(
                                                          fontSize: 16)),
                                                )).toList(),
                                        onChanged: (DepartmentList) =>
                                            setState(() => selectedDepartment =
                                                DepartmentList),
                                        menuMaxHeight: 300,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      'Date',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: TextField(
                                      cursorColor: Colors.grey,
                                      controller: dateInput,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Select Date',
                                        border: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () async {
                                            DateTime? date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2023),
                                                    builder: (context, child) => Theme(data: Theme.of(context).copyWith(
                                                      colorScheme: const ColorScheme.light(
                                                        primary: Color(0xFFb83058),
                                                        onPrimary: Colors.white,
                                                        onSurface: Color(0xFFb83058),
                                                      )
                                                    ),
                                                        child: child!),
                                            );
                                            setState(() {
                                              dateInput.text =
                                                  '${date!.day} / ${date.month} / ${date.year}';
                                            });
                                          },
                                          icon: const Icon(Icons.calendar_month,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/2.1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: DataTable2(
                                            headingRowColor: MaterialStateColor.resolveWith((states) {return Colors.grey.shade300;},),
                                            columnSpacing: 1,
                                            horizontalMargin: 5,
                                            dataRowHeight: 60,
                                            minWidth: 50,
                                            columns: const [
                                              DataColumn2(
                                                label: Center(child: Text('\nSr.\nNo',style: TextStyle(fontSize: 10.5),)),
                                                size: ColumnSize.S,
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('\nDepartment\nName',style: TextStyle(fontSize: 10.4),)),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Recieved',style: TextStyle(fontSize: 10.5),)),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Pending',style: TextStyle(fontSize: 10.5),)),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Resolved',style: TextStyle(fontSize: 10.5))),
                                                numeric: true,
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                                11,
                                                    (index) => DataRow(cells: [
                                                  DataCell(Center(child: Text("${index+1}",style: const TextStyle(fontSize: 11),))),
                                                  const DataCell(Center(child: Text('Water Resource Department',style: TextStyle(fontSize: 10),))),
                                                  const DataCell(Center(child: Text('60',style: TextStyle(fontSize: 10),))),
                                                  const DataCell(Center(child: Text('50',style: TextStyle(fontSize: 10),))),
                                                  const DataCell(Center(child: Text('10',style: TextStyle(fontSize: 10),)))
                                                ]))),
                                      ),
                                  ),
                                ],
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
    );
  }
}
