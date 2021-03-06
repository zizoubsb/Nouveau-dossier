import 'package:blogapp/screens/agence/add_offer.dart';
import 'package:blogapp/screens/agence/list_offer.dart';
import 'package:blogapp/screens/agence/login.dart';
import 'package:blogapp/screens/agence/my_offer.dart';
import 'package:blogapp/screens/agence/profile.dart';

import 'package:blogapp/services/agence_service.dart';
import 'package:blogapp/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    myoffer(),
    AddOfferView(),
    OffersListView(),
    Profile(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = myoffer(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            myoffer(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? C_3 : Colors.grey,
                        ),
                        Text(
                          'myoffer',
                          style: TextStyle(
                            color: currentTab == 0 ? C_3 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            AddOfferView(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: currentTab == 1 ? C_3 : Colors.grey,
                        ),
                        Text(
                          'add',
                          style: TextStyle(
                            color: currentTab == 1 ? C_3 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            OffersListView(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.store,
                          color: currentTab == 2 ? C_3 : Colors.grey,
                        ),
                        Text(
                          'offer',
                          style: TextStyle(
                            color: currentTab == 2 ? C_3 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 3 ? C_3 : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3 ? C_3 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*  appBar: AppBar(
        title: Text('Blog App'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              logout().then((value) => {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false)
              });
            },
          )
        ],
      ), */
/* */