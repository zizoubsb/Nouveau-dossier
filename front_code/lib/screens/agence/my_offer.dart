import 'package:blogapp/constant.dart';
import 'package:blogapp/models/Offer.dart';
import 'package:blogapp/models/Offer.dart';
import 'package:blogapp/models/api_response.dart';

import 'package:blogapp/screens/agence/DetailPage.dart';
import 'package:blogapp/screens/agence/add_offer.dart';
import 'package:blogapp/screens/comment_screen.dart';
import 'package:blogapp/screens/custom/OptionButton.dart';

import 'package:blogapp/services/agence_service.dart';

import 'package:blogapp/utils/constants.dart';
import 'package:blogapp/utils/custom_functions.dart';
import 'package:blogapp/utils/widget_functions.dart';

import 'package:flutter/material.dart';

import '../../models/Offer.dart';
import 'login.dart';
import 'edit_offer.dart';

class myoffer extends StatefulWidget {
  @override
  _myofferState createState() => _myofferState();
}

class _myofferState extends State<myoffer> {
  List<dynamic> offers = [];
  int userId = 0;
  bool _loading = true;

  late final dynamic itemData;
  // get all posts
  Future<void> retrieveoffers() async {
    userId = await Api.getAgenceId();
    ApiResponse response = await Api.getMyOffer();

    if (response.error == null) {
      setState(() {
        offers = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  void _handleDeletePost(int offerId) async {
    ApiResponse response = await Api.deleteOffer(offerId);
    if (response.error == null) {
      retrieveoffers();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    retrieveoffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return _loading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () {
              return retrieveoffers();
            },
            child: Scaffold(
                body: Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(padding),
                      addVerticalSpace(padding),
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: const Image(
                                  image: AssetImage('assets/images/logo.png')),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpace(20),
                      addVerticalSpace(10),
                      Expanded(
                        child: Padding(
                          padding: sidePadding,
                          child: ListView.builder(
                              //itemBuilder: _buildOfferItem,
                              itemCount: offers.length,
                              itemBuilder: (context, index) {
                                Offer post = offers[index];
                                //offers[index] = post;
                                //itemData = Post; post;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                                  post: post,
                                                )));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              child: Image(
                                                  image: AssetImage(
                                                      'assets/images/sale.jpg')),
                                            ),
                                            Positioned(
                                              top: 15,
                                              right: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: COLOR_WHITE,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                    border: Border.all(
                                                        color: COLOR_GREY
                                                            .withAlpha(40),
                                                        width: 2)),
                                                //CommentScreen
                                                child: PopupMenuButton(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10),
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        color: Colors.black,
                                                      )),
                                                  itemBuilder: (context) => [
                                                    const PopupMenuItem(
                                                        child: Text('Edit'),
                                                        value: 'edit'),
                                                  ],
                                                  onSelected: (val) {
                                                    if (val == 'edit') {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      PostForm(
                                                                        title:
                                                                            'Edit Post',
                                                                        post:
                                                                            post,
                                                                      )));
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        addVerticalSpace(15),
                                        Row(
                                          children: [
                                            Text(
                                              '${post.price}',
                                              style:
                                                  themeData.textTheme.headline6,
                                            ),
                                            addHorizontalSpace(20),
                                            Text(
                                              '${post.addres}',
                                              style:
                                                  themeData.textTheme.bodyText2,
                                            )
                                          ],
                                        ),
                                        addVerticalSpace(10),
                                        Row(
                                          children: [
                                            addVerticalSpace(10),
                                            Text(
                                              " ${post.categorie}  / ${post.area} m²",
                                              style:
                                                  themeData.textTheme.bodyText2,
                                            ),
                                            addHorizontalSpace(100),
                                            Text(
                                              '${post.operation}',
                                              style: const TextStyle(
                                                  color: C_3,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 36,
                    width: size.width,
                    child: Center(
                      child: OptionButton(
                        text: "Map View",
                        icon: Icons.map_rounded,
                        width: size.width * 0.40,
                      ),
                    ),
                  )
                ],
              ),
            )),
          );
  }
}
