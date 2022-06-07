import 'package:blogapp/screens/agence/login.dart';
import 'package:blogapp/screens/client/login_client.dart';

import 'package:blogapp/utils/constants.dart';
import 'package:blogapp/widgets/language_picker_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class route extends StatefulWidget {
  const route({Key? key}) : super(key: key);

  @override
  State<route> createState() => _routeState();
}

class _routeState extends State<route> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: C_3,
        backgroundColor: C_3,
        centerTitle: true,
        actions: [
          LanguagePickerWidget(),
          const SizedBox(width: 1),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: const Image(
                        image: AssetImage('assets/images/logo.png')),
                  ),
                  const Text(
                    'Immobilia',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: C_3,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => true);
                    },
                    height: 45,
                    minWidth: 240,
                    shape: const StadiumBorder(),
                    color: C_3,
                    child: Text(
                      AppLocalizations.of(context)!.agency,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Login_client()),
                          (route) => true);
                    },
                    height: 45,
                    minWidth: 240,
                    shape: const StadiumBorder(),
                    color: C_3,
                    child: Text(
                      AppLocalizations.of(context)!.client,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
