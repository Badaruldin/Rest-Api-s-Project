import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenWithSelfModel extends StatelessWidget {
  HomeScreenWithSelfModel({Key? key}) : super(key: key);
  final List<SelfModel> selfList = [];

  Future<List<SelfModel>> selfApiFun() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        SelfModel selfModel =
            SelfModel(title: i['title'], url: i['url'], id: i['id']);
        selfList.add(selfModel);
      }
      return selfList;
    } else {
      return selfList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api's with own model")),
      body: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: FutureBuilder(
            future: selfApiFun(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator(color: Colors.lightGreen,));
              } else {
                return ListView.separated(
                  itemCount: selfList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: SizedBox(width: 200,child: Text(snapshot.data![index].title.toString())),
                      //trailing: SizedBox(width: 250,child: Text(selfList[index].title.toString())),
                      title: Text(snapshot.data![index].id.toString()),
                      leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data![index].url)),
                    );
                  },
                );
              }
            },
          )),

          //2nd Exp
          const Divider(color: Colors.black),
          Expanded(
              child: FutureBuilder(
            future: selfApiFun(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.pink,
                  backgroundColor: Colors.blueGrey,
                ));
              } else {
                return ListView.separated(
                  itemCount: selfList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(color: Colors.green, height: 5.0);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: SizedBox(width: 150,child: Text(snapshot.data![index].title.toString())),
                      title: Text(selfList[index].id.toString()),
                      // title: Text(snapshot.data![index].id.toString()),
                      leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data![index].url)),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}

class SelfModel {
  String title, url;
  int id;

  SelfModel({required this.title, required this.url, required this.id});
}
