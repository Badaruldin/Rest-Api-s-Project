import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/PostModelClass.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<PostModelClass> postList = [];

  Future<List<PostModelClass>> getModelFun() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModelClass.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APIs Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getModelFun(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(postList[index].title.toString()),
                            trailing: Text(
                              postList[index].userId.toString(),
                            ),
                            subtitle: Text(
                              postList[index].body.toString(),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
