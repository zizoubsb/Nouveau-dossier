import 'package:blogapp/screens/agence/chat_agence/pages/message_page.dart';
import 'package:blogapp/screens/agence/chat_agence/theme.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final dynamic DATA;
  // ignore: non_constant_identifier_names
  const ChatTile({Key? key, this.DATA}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MessagePage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(children: [
          CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                DATA["imageUrl"],
              )),
          const SizedBox(
            width: 12,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("${DATA["name"]}", style: titleTextStyle),
            Text(
              "${DATA["text"]}",
            ),
          ]),
          const Spacer(),
          Text(
            "${DATA["time"]}",
            style: subtitleTextStyle,
          )
        ]),
      ),
    );
  }
}
