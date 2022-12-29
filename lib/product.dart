import 'dart:convert';
import 'package:dummyjson/main.dart';
import 'package:dummyjson/proview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool Status = false;
  Myproduct? myres;
  double? ffff;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print("res body==${response.body}");
    print("res sts code==${response.statusCode}");

    var res = jsonDecode(response.body);
    myres = Myproduct.fromJson(res);

    ffff = myres!.products![0].discountPercentage;

    print(ffff);
    setState(() {
      Status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Status
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return mainpage();
                      },
                    ));
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded)),
              title: Center(child: Text("product")),
            ),
            body: ListView.builder(
              itemCount: myres!.products!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Product();
                      },
                    ));
                  },
                  horizontalTitleGap: 30,
                  tileColor: Colors.white60,
                  shape: Border(
                      bottom: BorderSide(color: Colors.cyan, width: 5),
                      left: BorderSide(color: Colors.blueAccent, width: 3)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Productview(myres!.products![index]);
                      },
                    ));
                  },
                  leading: Card(
                      elevation: 10,
                      shadowColor: Colors.deepPurple,
                      child: SizedBox(
                          height: double.infinity,
                          width: 100,
                          child: Image.network(
                              "${myres!.products![index].thumbnail}"))),
                  title: Card(
                      elevation: 5,
                      color: Colors.white60,
                      child: Text("${myres!.products![index].title}")),
                  trailing: Card(
                      color: Colors.white54,
                      child: Card(
                          elevation: 10,
                          shadowColor: Colors.green,
                          child: Text("₹${myres!.products![index].price}"))),
                  subtitle: Card(child: Text("${ffff}"), elevation: 3),
                );
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

class Myproduct {
  List<Products>? products;

  Myproduct({this.products});

  Myproduct.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    double discountPercentage = json['discountPercentage'];
    dynamic rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
