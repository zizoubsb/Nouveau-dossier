import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu_agence extends StatelessWidget {
  const ProfileMenu_agence({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                  color: Colors.teal,
                ),
              )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
