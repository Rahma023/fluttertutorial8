import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=>HomePageState();
}

class HomePageState extends State<HomePage>{
  Future<String> getData() async{
    http.Response response=await http.get(
     Uri.endcodeFull("https://jsonplaceholder.typicode.com/posts")

     headers: {
       "Accept": "application/json"
     }
    );
   // print(response.body);

    List data=JSON.decode(response.body);
    print(data[1]);
    
    
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Get data"),
          onPressed: getData,

          
        ),
      ),
    );
  }
}
