
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utility/DashboardCommonWidget.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFb83058),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
            child: Container(
              decoration: BoxDecoration(
                  color:Colors.white,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,right: MediaQuery.of(context).size.width/15,top: MediaQuery.of(context).size.height/4.9
            ),
            child: Container(
              height: MediaQuery.of(context).size.height/1.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,

                      blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0, 5)
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),

              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.only(right: 5,top: 18),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: SvgPicture.asset('assets/images/edit.svg',height: 16,width: 16,)
            ),
                ),
                    const Text('Mukul Joshi',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat-Medium'
                    ),),
                    SizedBox(height:20,),
                    profileListTile(),
                    profileListTile(
                        iconImagePath: 'assets/images/email.svg',
                        iconImageText: 'mukeshjoshi@gmail.com',
                    ),
                    profileListTile(
                      iconImagePath: 'assets/images/location.svg',
                      iconImageText: 'Osmanabad',
                    ),
                    profileListTile(
                      iconImagePath: 'assets/images/District.svg',
                      iconImageText: 'Tuljapur',
                    ),
                    profileListTile(
                      iconImagePath: 'assets/images/Village.svg',
                      iconImageText: 'Ambewadi',
                    ),
                    const Spacer(),
                    profileListTile(
                      iconImagePath: 'assets/images/logout pink.svg',
                      iconImageText: 'Logout',
                    ),
                    SizedBox(height:10,)

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/6.2,
            left: MediaQuery.of(context).size.width/2.4,
            child: CircleAvatar(
              radius: 36,
              child: SvgPicture.asset('assets/images/Profile Colorful.svg',),
              //   backgroundImage: AssetImage('assets/images/dashboard_screen/Profile Colorful.png',),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                InkWell(
                  onTap:(){
                   Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back_ios_sharp,size: 25, color:Colors.white,)),
                SizedBox(width: MediaQuery.of(context).size.width/25,),
                const Text('Profile',style: TextStyle(
                    color:Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat-Regular'
                ),)
              ],
            ),
          )
        ],
      )
    );
  }
}
