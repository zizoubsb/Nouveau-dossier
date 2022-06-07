import 'dart:io';

import 'package:blogapp/constant.dart';
import 'package:blogapp/models/Offer.dart';
import 'package:blogapp/models/api_response.dart';

import 'package:blogapp/services/agence_service.dart';
import 'package:blogapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'home.dart';
import 'login.dart';

class PostForm extends StatefulWidget {
  final Offer? post;
  final String? title;

  PostForm({this.post, this.title});

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtControllerprice = TextEditingController();
  final TextEditingController _txtControllerbedrooms = TextEditingController();
  final TextEditingController _txtControlleraddres = TextEditingController();
  final TextEditingController _txtControllerarea = TextEditingController();
  final TextEditingController _txtControllerbathrooms = TextEditingController();
  final TextEditingController _txtControllerkitchen = TextEditingController();
  final TextEditingController _txtControllergarage = TextEditingController();

  final TextEditingController _txtControllename_agence =
      TextEditingController();
  final TextEditingController _txtControllerdescription =
      TextEditingController();

  // edit post
  void _editPost(int postId) async {
    ApiResponse response = await Api.editPost(
        postId,
        /*String operation,
      String name_agence,
      String categorie, */
        _txtControllerprice.text,
        _txtControllerbedrooms.text,
        _txtControlleraddres.text,
        _txtControllerarea.text,
        _txtControllerbathrooms.text,
        _txtControllerkitchen.text,
        _txtControllergarage.text,
        _txtControllename_agence.text,
        _txtControllerdescription.text);
    if (response.error == null) {
      Navigator.of(context).pop();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {});
    }
  }

  @override
  void initState() {
    /*if (widget.post != null) {
      _txtControllerBody.text = widget.post!.addres ?? '';
    }*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Form(
          //key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Agency information',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'name_agence',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllename_agence,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Offer information',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'price',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllerprice,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'bedrooms',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllerbedrooms,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'addres',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControlleraddres,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'area',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllerarea,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'bathrooms',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllerbathrooms,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'kitchen',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllerkitchen,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'garage',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllergarage,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  // hintText: ,
                  labelText: 'description',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _txtControllerdescription,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  _editPost(widget.post!.id ?? 0);
                },
                height: 45,
                minWidth: 240,
                shape: const StadiumBorder(),
                color: C_3,
                child: const Text(
                  "Edit Offer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
