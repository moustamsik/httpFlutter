

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart'as httpm;
import 'dart:convert';

class Http extends StatefulWidget {
  const Http({super.key});

  @override
  State<Http> createState() => _HttpState();
}

class _HttpState extends State<Http> {
  List Post=[];

  Future getPost() async{
   
    var  url = Uri.parse('https://jsonplaceholder.typicode.com/albums') ;
    var response = await httpm.get(url);
    var responsebody = jsonDecode(response.body);
     print ("porte");

   setState(() {
      Post.addAll(responsebody);
   });
        print(Post);
    print ("porte");
    
  }
  @override
  void initState() {
    getPost();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("HTTP TEST"),
      ),
      body:  Post == null || Post.isEmpty 
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount:Post.length ,
        itemBuilder:(context,i){
        return ListTile(
          title: Text("${Post[i]['title']}"),
        );
      } 
      )
      ),
    );
  }
}