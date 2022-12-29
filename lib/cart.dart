import 'dart:convert';

import 'package:dummyjson/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Mycart? crt;
  bool Status = false;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var url = Uri.parse('https://dummyjson.com/carts');
    var response = await http.get(url);
    print("res body==${response.body}");
    print("res sts code==${response.statusCode}");

    var res = jsonDecode(response.body);
    crt = Mycart.fromJson(res);
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
              title: Text("Cart"),
            ),
            body: ListView.builder(

              itemCount: crt!.carts!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("ID:${crt!.carts![index].id}"),
                    subtitle: Text("UID:${crt!.carts![index].userId}"),
                    trailing: Text("Total:${crt!.carts![index].total}"),

                  ),
                );
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

class Mycart {
  List<Carts>? carts;

  Mycart({this.carts});

  Mycart.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carts != null) {
      data['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  int? id;
  List<Products>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts(
      {this.id,
      this.products,
      this.total,
      this.discountedTotal,
      this.userId,
      this.totalProducts,
      this.totalQuantity});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['discountedTotal'] = this.discountedTotal;
    data['userId'] = this.userId;
    data['totalProducts'] = this.totalProducts;
    data['totalQuantity'] = this.totalQuantity;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;

  Products(
      {this.id,
      this.title,
      this.price,
      this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedPrice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    dynamic discountPercentage = json['discountPercentage'];
    discountedPrice = json['discountedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['discountPercentage'] = this.discountPercentage;
    data['discountedPrice'] = this.discountedPrice;
    return data;
  }
}
