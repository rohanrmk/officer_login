import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                padding:  EdgeInsets.only(bottom: 40.0),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/Login.svg",
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height /5,
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.60,
                  width: MediaQuery.of(context).size.width / 1.21,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 6,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 21,
                              // fontWeight: FontWeight.w600,
                              color: Color(0xFFb83058),
                              fontFamily: 'Montserrat-SemiBold',
                             // fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25),
                        child: SizedBox(
                          height: 47,
                          child: TextFormField(
                            style: const TextStyle(fontFamily: 'Montserrat-Bold',height: 1),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              hintText: 'User Name',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.w300
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFb83058), width: 1.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: SvgPicture.asset(
                                'assets/images/Profile.svg',
                                fit: BoxFit.scaleDown,
                                height: 5,
                                width: 5,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 15
                        ),
                        child: SizedBox(
                          height: 47,
                          child: TextFormField(
                            style: const TextStyle(
                                fontFamily: 'Montserrat-Bold',height: 1),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.w300
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFb83058), width: 1.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: const [
                         Text(''),
                         Text(
                           "Citizen's Login      ",
                           style: TextStyle(
                             fontSize: 14,
                             fontFamily: 'Montserrat-Regular',
                             fontWeight: FontWeight.w300,
                             color: Colors.transparent,
                             shadows: [
                               Shadow(offset: Offset(0, -8), color: Colors.blue)
                             ],
                             // Step 3 SEE HERE
                             decoration: TextDecoration.underline,
                             decorationColor: Colors.blue,
                           ),
                         ),
                       ],
                     ),
                      SizedBox(height: 25,)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.23),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed('/DashBoardScreen');
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
