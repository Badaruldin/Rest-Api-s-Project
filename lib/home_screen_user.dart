import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis_project/Models/UsersModel.dart';

class HomeScreenUsers extends StatelessWidget {
  HomeScreenUsers({Key? key}) : super(key: key);

  List<UserModel> usersList = [];

  Future<List<UserModel>> usersApiFun() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        //here <String,dynamic> is because simple Map gives <dynamic,dynamic> and required is <String,dynamic>
        usersList.add(UserModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text("Home Screen Users Api"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
