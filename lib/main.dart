import 'package:dummyjson/cart.dart';
import 'package:dummyjson/post.dart';
import 'package:dummyjson/product.dart';
import 'package:dummyjson/quotes.dart';
import 'package:dummyjson/todos.dart';
import 'package:dummyjson/user.dart';
import 'package:flutter/material.dart';
import 'comment.dart';

void main() {
  runApp(MaterialApp(
    home: mainpage(),
  ));
}

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  bool sts = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("DummyJson")),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 8,
          shape:
              Border.fromBorderSide(BorderSide(color: Colors.deepPurpleAccent)),
          color: Colors.white30,
          shadowColor: Colors.blueGrey,
          child: Column(
            children: [
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Product();
                      },
                    ));
                  },
                  child: Text(
                    "Product",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.italic),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Cart();
                      },
                    ));
                  },
                  child: Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.italic),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return User();
                      },
                    ));
                  },
                  child: Text(
                    "User",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.italic),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Post();
                      },
                    ));
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.italic),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Commentt();
                      },
                    ));
                  },
                  child: Text(
                    "Comment",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.italic),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Qoutes();
                      },
                    ));
                  },
                  child: Text(
                    "Quotes",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.italic),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Todos();
                      },
                    ));
                  },
                  child: Text(
                    "Todos",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontStyle: FontStyle.italic),
                  )),
              


            ],
          ),
        ),
      ),
    );
  }
}
