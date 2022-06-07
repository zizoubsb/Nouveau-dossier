class Client {
  int? id;
  String? name;
  String? image;
  String? email;
  String? token;

  Client({this.id, this.name, this.image, this.email, this.token});

  // function to convert json data to user model
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        id: json['client']['id'],
        name: json['client']['name'],
        image: json['client']['image'],
        email: json['client']['email'],
        token: json['token']);
  }
}
/*//import 'user.dart';
class Post {
  int? id;
  String? price;
  String? bedrooms;
  String? addres;
  String? area;
  String? bathrooms;
  String? kitchen;
  String? garage;
   String? description;

  Post({
    this.id,
    this.price,
    this.bedrooms,
    this.addres,
    this.area,
    this.bathrooms,
    this.kitchen,
    this.garage,
    this.description,
  });
/*'price',
    'bedrooms',
    'addres',
    'area',
    'bathrooms',
    'kitchen',
    'garage',
    'description',
     */
// map json to post model

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      price: json['price'],
      bedrooms: json['bedrooms'],
      addres: json['addres'],
       area: json['area'],
        bathrooms: json['bathrooms'],
         kitchen: json['kitchen'],
          garage: json['garage'],
           description: json['description'],


 */