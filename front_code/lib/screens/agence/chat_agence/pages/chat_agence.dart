import 'package:blogapp/screens/agence/chat_agence/data.dart';
import 'package:blogapp/screens/agence/chat_agence/theme.dart';
import 'package:blogapp/screens/agence/chat_agence/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

import 'package:blogapp/utils/constants.dart';

// ignore: camel_case_types
class Chat_agence extends StatefulWidget {
  @override
  _Chat_agenceState createState() => _Chat_agenceState();
}

class _Chat_agenceState extends State<Chat_agence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      /*  floatingActionButton: FloatingActionButton(
        backgroundColor: greenColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),*/
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            /*  CircleAvatar(
                radius: 55,
                backgroundImage: const AssetImage('assets/images/group2.png')),*/

            /*Image.asset(
              'assets/images/profile.png',
              height: 100,
              width: 100,
            ),*/
            /*   const SizedBox(
              height: 20,
            ),*/
            /* Text(
              'Anis boulaouidet ',
              style: TextStyle(fontSize: 20, color: whiteColor),
            ),*/
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Messages',
                        style: TextStyle(
                            fontSize: 20,
                            color: COLOR_DARK_BLUE,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(25),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: DATA.length,
                  itemBuilder: (context, index) {
                    return ChatTile(
                      DATA: DATA[index],
                    );
                  }),
            )),

            /* ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: DATA.length,
                itemBuilder: (context, index) {
                  return ChatTile(
                    DATA: DATA[index],
                  );
                }),*/
          ]),
        ),
      ),
    );
  }
}
