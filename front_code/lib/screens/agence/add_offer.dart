import 'dart:convert';
import 'dart:io';

import 'package:blogapp/screens/agence/home.dart';
import 'package:blogapp/screens/client/map/find_friends.dart';
import 'package:blogapp/services/agence_service.dart';
import 'package:blogapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddOfferView extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOfferView> {
  @override
  void initState() {
    super.initState();
    //_loadCategories();
  }

  ImagePicker _picker = ImagePicker();

  var user_id = 1;
  var price;
  var addres;
  var bedrooms;
  var bathrooms;
  var area;
  var kitchen;
  var description;
  var garage;
  var numberphone;
  var name_agence;
  var longitude;
  var latitude;
  var categories = [];

  List<XFile> images = [];
  //   {'id': 1, 'name': 'category 1'},
  //   {'id': 2, 'name': 'category 2'}
  // ];

  late File _image;
  //final picker = imagepic;
  String categorie = 'apartment';
  String operation = 'for sale';
  // List of items in our dropdown menu
  var items = [
    'apartment',
    'Villa',
    'studio',
    'GROUND',
    //'Item 5',
  ];
  var item = [
    'for sale',
    'for rent',
    ' exchange'
    //'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Offer'),
        backgroundColor: C_3,
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: _buildFormFields(),
          )
        ],
      ),
    );
  }
  //zizou@gmail.com

  Widget _buildFormFields() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              onChanged: (value) {
                name_agence = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // hintText: ,

                labelText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone_android),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                numberphone = value;
              },
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
              decoration: InputDecoration(
                // hintText: ,
                labelText: 'addres',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                addres = value;
              },
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
              onChanged: (value) {
                price = value;
              },
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
              onChanged: (value) {
                bedrooms = value;
              },
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
              onChanged: (value) {
                bathrooms = value;
              },
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
              onChanged: (value) {
                area = value;
              },
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
              onChanged: (value) {
                kitchen = value;
              },
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
              onChanged: (value) {
                description = value;
              },
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
              onChanged: (value) {
                garage = value;
              },
            ),

            DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: DropdownButton(
                      // Initial Value
                      value: categorie,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      onChanged: (String? value) {
                        setState(() {
                          categorie = value!;
                        });
                      },
                      isExpanded:
                          true, //make true to take width of parent widget
                      //underline: Container(), //empty line
                      // style: TextStyle(fontSize: 18, color: Colors.white),

                      // iconEnabledColor: Colors.white, //Icon color
                    ))),
            //zizou@gmail.com
            const SizedBox(
              height: 20,
            ),
            DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: DropdownButton(
                      // Initial Value
                      value: operation,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: item.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      onChanged: (String? value) {
                        setState(() {
                          operation = value!;
                        });
                      },
                      isExpanded:
                          true, //make true to take width of parent widget
                      //underline: Container(), //empty line
                      //style: TextStyle(fontSize: 18, color: Colors.white),

                      //  iconEnabledColor: Colors.white, //Icon color
                    ))),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const FindFriends()),
                    (route) => true);
              },
              height: 45,
              minWidth: 240,
              shape: const StadiumBorder(),
              color: C_3,
              child: const Text(
                "go to google map",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
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
                labelText: 'latitude',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                latitude = value;
              },
            ),

            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // hintText: ,
                labelText: 'longitude',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                longitude = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: _pickImages,
              height: 45,
              minWidth: 240,
              shape: const StadiumBorder(),
              color: C_3,
              child: const Text(
                "Add Images",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _buildGridView(),

            MaterialButton(
              onPressed: () {
                _submit();
              },
              height: 45,
              minWidth: 240,
              shape: const StadiumBorder(),
              color: C_3,
              child: const Text(
                "Add Offer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),

            //_buildRegisterText(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(File(_image.path));
    }
  }

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        File image = File(images[index].path);
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Image.file(
                image,
                width: 300,
                height: 300,
              ),
              Positioned(
                right: 5,
                top: 5,
                child: InkWell(
                  child: Icon(
                    Icons.remove_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  _pickImages() async {
    List<XFile>? res = await _picker.pickMultiImage();
    setState(() {
      images.addAll(res!);
    });
  }

  void _submit() async {
    var data = Map<String, String>();
    data['numberphone'] = numberphone;
    data['addres'] = addres;
    data['price'] = price;
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['area'] = area;
    data['garage'] = garage;
    data['kitchen'] = kitchen;
    data['description'] = description;
    data['categorie'] = categorie;
    data['operation'] = operation;
    // data['image'] = _image.path;
    data['name_agence'] = name_agence;

    data['longitude'] = longitude;
    data['latitude'] = latitude;

    //var response = await Api().postDataWithImages(data, '/offer', images);
    // var response = await Api.postOffer(data, '/offer');
    var response = await Api().postDataWithImages(data, '/offer', images);
    if (response.statusCode == 201) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    } else {
      _showMsg('Error ${response.statusCode}');
    }
  }

  _showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    ));
  }
}
