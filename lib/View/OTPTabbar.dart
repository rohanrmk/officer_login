import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import 'MobileNumber.dart';
import 'OTPDesignPage.dart';
import 'SignUp.dart';

class OTPTabPage extends StatefulWidget {
  const OTPTabPage({Key? key}) : super(key: key);

  @override
  State<OTPTabPage> createState() => _OTPTabPageState();
}

class _OTPTabPageState extends State<OTPTabPage> {
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              color: const Color(0xFFb83058),
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 40.0,),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/OTP.svg",
                    height: 100,
                    width: 40,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height /6,
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height /17,
                  ),
                  child: Center(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: MediaQuery.of(context).size.height / 1.55,
                      width: MediaQuery.of(context).size.width / 1.19,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),

                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6,
                            )
                          ]),
                      child:   Column(
                        children: [

                          TabBar(padding: const EdgeInsets.only(top: 15,bottom: 15),
                            indicatorColor: const Color(0xFFb83058),
                            controller: _tabController,
                            labelColor:  Color(0xFFb83058) ,
                            unselectedLabelColor:  Colors.black87,
                            tabs: const [
                              Tab(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 15,

                                    fontFamily: 'Montserrat-SemiBold',

                                  ),
                                ),
                              ),
                              Tab(
                                child: Text("SIGNUP ",
                                  style: TextStyle(
                                    fontSize: 15,

                                    fontFamily: 'Montserrat-SemiBold',

                                  ),),
                              ),
                            ],
                          ),
                          const Expanded(
                              flex: 1,
                              child: TabBarView(children: [OTP_Page (),SignUp()],))

                        ],
                      ),
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.16),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed('/login');
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child:
                    SvgPicture.asset("assets/images/Arrow Pink.svg", height: 50),
                  ),
                ),
              ),
            ),
            /*Container(
              height: MediaQuery.of(context).size.height / 0.5,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children:  const [
                  Text(
                    "Powered By : ",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Montserrat'),

                  ),
                  Image(image: AssetImage("assets/img.png"),height: 20,)
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
