//jhh

/*
//login controler


class LoginApiController extends GetxController{
var token="".obs;
final isLoading=false.obs;

Future getLoginData({required String url,required Map<String, dynamic> data})async{
try{
isLoading(true);
var loginResponse=await ApiCaling.callPostApi(url: url, data: data);
var success=LoginData.fromJson(loginResponse);
token.value=result.accessToken;
}

finally{
isLoading(false);
}
}
}



//num otp classmodel


NumberOtp numberOtpFromJson(String srt)=>NumberOtp.fromJson(json.decode(str));
String numberOtpToJson(NumberOtp data)=>json.encode(data.toJson());

class NumberOtp{
NumberOtp({
required this.phoneNo,
required this.otp,
});
String phoneNo;
String otp;

factory NumberOtp.fromJson(Map<String, dynamic> json)=>NumberOtp(
phoneNo: json["phoneNo"],
otp:json["otp"],
);
Map<String, dynamic> toJson()=>{
"phoneNo":phoneNo,
"otp":otp,
};
}


//login page

var loginData=Get.put<LoginApiController>(LoginApiController());


try{
await loginData.getLoginData(url: Allurl.loginUrl.value, data: data).then((val)=>Get.off(()=>
OfferPage(token: loginData.token.toString())));

}catch(e){
print(e.toString());
Get.snackbar("error",e.toString(),
snackPosition: SnackPosition.BOTTOM,
colorText: Colors.black,
backgroundColor: Colors.red);
}



//ofer controlr

class offerApiController extends GetxController{
var data=<Offer>[].obs;
final isLoading=true.obs;
Future getOfferData({required String url, required String token})async{
try{
isLoading(true);
var response=await Apicaling.callGetApi(url: url,token:token);
var success=Offerdata.fromJson(response)
data.assignAll(success.offers);
}
finally{
isLoading(false);
}

}

}


//ofer page

var offerData=Get.put<offerApiController>(offerApiController());

@override
void initState(){
super.initState();
getOfferData();
}

Future<void> getOfferData() async{
offerData.getOfferData(url: Allapi.offerUrl.value,token: widget.token);
}




*/

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
