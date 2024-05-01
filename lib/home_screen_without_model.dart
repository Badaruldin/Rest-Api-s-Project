import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  var data;
class HomeScreenWithoutModel extends StatelessWidget {
  HomeScreenWithoutModel({Key? key}) : super(key: key);


  Future<void> modelFreeApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      print('at asyncFun null List');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueGrey,
          title: Text("Api Without Model"),
        ),
        body: FutureBuilder(
            future: modelFreeApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState==ConnectionState.waiting) {
                print('Circle Showing');
                return const CircularProgressIndicator(
                    color: Colors.purple, backgroundColor: Colors.grey);
              }
              else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      print('Data Loaded');
                      return Column(
                        children: [
                          Text(data[index]['name'].toString()),
                          Text(data[index]['address'].toString()),
                          const Divider(),
                        ],
                      );
                    });
              }
            }));
  }
}
/*

 */
