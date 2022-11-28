import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io','api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']){
      
    }
  }

  @override
  Widget build(BuildContext context) {
    getTeams();
    return Scaffold(

    );
  }
}
