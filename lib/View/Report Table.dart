import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utility/List.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
                  height: MediaQuery.of(context).size.height / 2.42,
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
                        "Satisfied / Unsatisfied Report",
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
                      width: MediaQuery.of(context).size.width / 1.05,
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
                                        value: selectedSatisfiedReport,
                                        items: SatisfiedReporttList.map(
                                                (SatisfiedReporttList) =>
                                                DropdownMenuItem<String>(
                                                  value: SatisfiedReporttList,
                                                  child: Text(SatisfiedReporttList,
                                                      style: const TextStyle(
                                                          fontSize: 16)),
                                                )).toList(),
                                        onChanged: (SatisfiedReporttList) =>
                                            setState(() => selectedSatisfiedReport =
                                                SatisfiedReporttList),
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
                                                    onPrimary: Colors.black54,
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
                                          horizontalMargin: 10,
                                          dataRowHeight: 55,
                                          minWidth: 50,
                                          headingRowHeight: 62,
                                          columns:  [
                                            const DataColumn2(
                                              label: Center(child: Text('\nSr.\nNo',style: TextStyle(fontSize: 11),)),
                                              size: ColumnSize.S,
                                            ),
                                            const DataColumn(
                                              label: Center(child: Text('\nDepartment\nName',style: TextStyle(fontSize: 11),)),
                                            ),
                                            const DataColumn(
                                              label: Center(child: Text('Recieved',style: TextStyle(fontSize: 11),)),
                                            ),
                                            DataColumn(
                                              label: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(height: 6),
                                                    const Text('\nCleared',style: TextStyle(fontSize: 11),),
                                                    Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(bottom: 2.0),
                                                        child: Row(
                                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: const [
                                                          Text("\nSatisfied ",style: TextStyle(fontSize: 8),),
                                                          Text("\nUnSatisfied",style: TextStyle(fontSize: 8),),
                                                        ],),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                          rows: List<DataRow>.generate(
                                              11,
                                                  (index) => DataRow(cells: [
                                                DataCell(Center(child: Text("${index+1}",style: const TextStyle(fontSize: 11),))),
                                                const DataCell(Center(child: Text('Water Resource Department',style: TextStyle(fontSize: 10),))),
                                                const DataCell(Center(child: Text('60',style: TextStyle(fontSize: 10),))),
                                                DataCell(Center(child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: const [
                                                    Text('50',style: TextStyle(fontSize: 10),),
                                                    Text('10',style: TextStyle(fontSize: 10),),
                                                  ],
                                                ))),
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
