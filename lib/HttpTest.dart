import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class HttpTest extends StatefulWidget {
  const HttpTest({super.key});

  @override
  State<HttpTest> createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  List Post=[];
  Future getPost()async{

    var url=Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);
    var reponsedec = jsonDecode(response.body);
 print(reponsedec);
    setState(() {
      Post.addAll(reponsedec);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(
        title: Text("Http Test"),
      ),
      body: Post==null || Post.isEmpty 
      ?Center(child: CircularProgressIndicator(),)
        
      :ListView.builder(
        itemCount: Post.length,
        itemBuilder: (context,i){
        return ListTile(
          title: Text("${Post[i]['title']}") ,
        );
      }),
    ));
  }
}