import 'package:blogapp/screens/agence/chat_agence/data.dart';
import 'package:blogapp/screens/agence/chat_agence/theme.dart';
import 'package:blogapp/screens/agence/chat_agence/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/profile.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Sabrina Carpenter',
              style: TextStyle(fontSize: 20, color: whiteColor),
            ),
            Text(
              'Travel Freelancer',
              style: TextStyle(fontSize: 16, color: mutedColor),
            ),
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
                  Text(
                    'Friends',
                    style: titleTextStyle,
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
