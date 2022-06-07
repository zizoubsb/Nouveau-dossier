import 'package:blogapp/route.dart';
import 'package:blogapp/screens/agence/profile_agence/profile_agence_menu.dart';

import 'package:blogapp/services/agence_service.dart';

import 'package:flutter/material.dart';
import 'package:blogapp/utils/constants.dart';

class Profile_agence extends StatefulWidget {
  @override
  _Profile_agenceState createState() => _Profile_agenceState();
}

class _Profile_agenceState extends State<Profile_agence> {
  var w = Colors.white;
  var b = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor : b,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: C_3,
        centerTitle: true,
        title: Text(
          "Compte",
          style: TextStyle(color: C_4),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
                radius: 65,
                backgroundImage:
                    const AssetImage('assets/images/agence2.webp')),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Immobilia ',
              style: TextStyle(fontSize: 35, color: C_3),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: b,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    SizedBox(height: 5),
                    ProfileMenu_agence(
                      text: "My Account",
                      icon: "assets/icons/User Icon.svg",
                      press: () => {},
                    ),
                    ProfileMenu_agence(
                      text: "Notifications",
                      icon: "assets/icons/Bell.svg",
                      press: () {},
                    ),
                    ProfileMenu_agence(
                      text: "Settings",
                      icon: "assets/icons/Settings.svg",
                      press: () {},
                    ),
                    ProfileMenu_agence(
                      text: "Help Center",
                      icon: "assets/icons/Question mark.svg",
                      press: () {},
                    ),
                    ProfileMenu_agence(
                      text: "Log Out",
                      icon: "assets/icons/Log out.svg",
                      press: () {
                        logout().then((value) => {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const route()),
                                  (route) => false)
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
