import 'package:blogapp/constant.dart';
import 'package:blogapp/models/agence.dart';
import 'package:blogapp/models/api_response.dart';

import 'package:blogapp/screens/agence/home.dart';

import 'package:blogapp/services/agence_service.dart';
import 'package:blogapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../responsive.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmController = TextEditingController();

  void register_agence() async {
    ApiResponse response = await Api.register_agence(
        nameController.text, emailController.text, passwordController.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as Agence);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Save and redirect to home
  void _saveAndRedirectToHome(Agence agence) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', agence.token ?? '');
    await pref.setInt('agenceID', agence.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          C_4,
          C_3,
          C_2,
        ])),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  // #login, #welcome
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.sign_in,
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: Form(
                      key: formKey,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 32),
                        children: [
                          TextFormField(
                              controller: nameController,
                              validator: (val) => val!.isEmpty
                                  ? AppLocalizations.of(context)!.plz_enter_name
                                  : null,
                              decoration: kInputDecoration(
                                  AppLocalizations.of(context)!.name,
                                  Icons.person)),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => val!.isEmpty
                                  ? AppLocalizations.of(context)!
                                      .plz_enter_email
                                  : null,
                              decoration: kInputDecoration(
                                  AppLocalizations.of(context)!.enter_email,
                                  Icons.email)),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              validator: (val) => val!.length < 6
                                  ? AppLocalizations.of(context)!.require_6car
                                  : null,
                              decoration: kInputDecoration(
                                  AppLocalizations.of(context)!.enter_password,
                                  Icons.lock)),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              controller: passwordConfirmController,
                              obscureText: true,
                              validator: (val) => val != passwordController.text
                                  ? AppLocalizations.of(context)!
                                      .confirmed_pass_dont_match
                                  : null,
                              decoration: kInputDecoration(
                                  AppLocalizations.of(context)!.confirm_pass,
                                  Icons.lock)),
                          SizedBox(
                            height: 20,
                          ),
                          loading
                              ? Center(child: CircularProgressIndicator())
                              : MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        loading = !loading;
                                        register_agence();
                                      });
                                    }
                                  },
                                  height: 45,
                                  minWidth: 240,
                                  shape: const StadiumBorder(),
                                  color: C_4,
                                  child: Text(
                                    AppLocalizations.of(context)!.register,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                          /* : kTextButton(
                                  'Register',
                                  () {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        loading = !loading;
                                        _registerUser();
                                      });
                                    }
                                  },
                                ),*/
                          /*MaterialButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      setState(() {
                                        loading = true;
                                        _loginUser();
                                      });
                                    }
                                  },
                                  height: 45,
                                  minWidth: 240,
                                  shape: const StadiumBorder(),
                                  color: Colors.green.shade500,
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ), */

                          /* Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Login()),
                                (route) => false); */
                          SizedBox(
                            height: 20,
                          ),
                          kLoginRegisterHint(
                              AppLocalizations.of(context)!
                                  .already_have_account,
                              AppLocalizations.of(context)!.login, () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                                (route) => false);
                          })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!Responsive.isMobile(context))
              Expanded(child: Image.asset('assets/images/splash01.png')),
          ],
        ),
      ),
    );
  }
}
/* Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          children: [
            TextFormField(
                controller: nameController,
                validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                decoration: kInputDecoration('Name')),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val!.isEmpty ? 'Invalid email address' : null,
                decoration: kInputDecoration('Email')),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (val) =>
                    val!.length < 6 ? 'Required at least 6 chars' : null,
                decoration: kInputDecoration('Password')),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordConfirmController,
                obscureText: true,
                validator: (val) => val != passwordController.text
                    ? 'Confirm password does not match'
                    : null,
                decoration: kInputDecoration('Confirm password')),
            SizedBox(
              height: 20,
            ),
            loading
                ? Center(child: CircularProgressIndicator())
                : kTextButton(
                    'Register',
                    () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = !loading;
                          _registerUser();
                        });
                      }
                    },
                  ),
            SizedBox(
              height: 20,
            ),
            kLoginRegisterHint('Already have an account? ', 'Login', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            })
          ],
        ),
      ), */