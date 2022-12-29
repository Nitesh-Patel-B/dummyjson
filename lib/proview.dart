import 'package:dummyjson/main.dart';
import 'package:dummyjson/order.dart';
import 'package:dummyjson/product.dart';
import 'package:flutter/material.dart';

class Productview extends StatefulWidget {
  Products product;
  Productview(this.product);

  @override
  State<Productview> createState() => _ProductviewState();
}

class _ProductviewState extends State<Productview> {
  bool sts = true;
  @override
  Widget build(BuildContext context) {
    return sts
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
              title: Text("viewproduct"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${widget.product.brand}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.brown),
                        )
                      ],
                    ),
                    Row(
                      children: [Text("${widget.product.category}")],
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: widget.product.images!.length,
                        itemBuilder: (context, index) {
                          return PageView(
                            children: [
                              Image.network("${widget.product.images![index]}"),
                            ],
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                            child: Text(
                          "Product Details",
                          style: TextStyle(fontSize: 30, color: Colors.green),
                        ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Card(
                            elevation: 5,
                            child: Text(
                              "${widget.product.id}.",
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            child: Text("${widget.product.title}",
                                style: TextStyle(fontSize: 30)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Description: ${widget.product.description}",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Stock: ${widget.product.stock}",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Card(
                        elevation: 5,
                        child: Text(
                          "Price: ₹${widget.product.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.orange,
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              backgroundColor: Colors.black12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: MaterialButton(
                        minWidth: 10,
                        height: 50,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Order();
                            },
                          ));
                        },
                        color: Color(0xff0095ff),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Order Now",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
