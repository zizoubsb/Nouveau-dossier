import 'package:blogapp/responsive.dart';
import 'package:blogapp/screens/client/screens/HomeClient.dart';
import 'package:blogapp/screens/client/screens/MenuController.dart';
import 'package:blogapp/screens/client/screens/header.dart';
import 'package:blogapp/screens/client/screens/web_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../route.dart';
import '../../services/agence_service.dart';
import '../../splash screens/constant2.dart';
import '../../widgets/language_picker_widget.dart';
import '../agence/list_offer.dart';

class CustomClientDrawer extends StatefulWidget {
  const CustomClientDrawer({Key? key}) : super(key: key);

  @override
  CustomClientDrawerState createState() => CustomClientDrawerState();
}

class CustomClientDrawerState extends State<CustomClientDrawer> {
  final _advancedDrawerController = AdvancedDrawerController();
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Responsive(
      mobile: AdvancedDrawer(
        backdropColor: Colors.blueGrey.withOpacity(0.9),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Home_client(),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 64.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/user_2.png")),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.language,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    onTap: () {},
                    leading: LanguagePickerWidget(),
                    /*title: Text(
                        AppLocalizations.of(context)!.home_page,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                      ),*/
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person),
                    onTap: () {},
                    title: Text(
                      AppLocalizations.of(context)!.profile,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    leading: ImageIcon(
                      AssetImage("assets/images/favicon2.png"),
                      size: 24,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.favourite,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/images/settingsicon.png"),
                      size: 24,
                    ),
                    onTap: () {},
                    title: Text(
                      AppLocalizations.of(context)!.settings,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      logout().then((value) => {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const route()),
                                (route) => false)
                          });
                    },
                    leading: Icon(Icons.logout),
                    title: Text(
                      AppLocalizations.of(context)!.log_out,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text(AppLocalizations.of(context)!.terms),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      tablet: AdvancedDrawer(
        backdropColor: Colors.blueGrey.withOpacity(0.9),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Home_client(),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 64.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/user_2.png")),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.language,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    onTap: () {},
                    leading: LanguagePickerWidget(),
                    /*title: Text(
                        AppLocalizations.of(context)!.home_page,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                      ),*/
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person),
                    onTap: () {},
                    title: Text(
                      AppLocalizations.of(context)!.profile,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    leading: ImageIcon(
                      AssetImage("assets/images/favicon2.png"),
                      size: 24,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.favourite,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/images/settingsicon.png"),
                      size: 24,
                    ),
                    onTap: () {},
                    title: Text(
                      AppLocalizations.of(context)!.settings,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      logout().then((value) => {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const route()),
                                (route) => false)
                          });
                    },
                    leading: Icon(Icons.logout),
                    title: Text(
                      AppLocalizations.of(context)!.log_out,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text(AppLocalizations.of(context)!.terms),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      web: Scaffold(
        key: _controller.scaffoldkey,
        //drawer: SideMenu(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                constraints: BoxConstraints(maxWidth: kMaxWidth),
                child: SafeArea(child: OffersListView()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
