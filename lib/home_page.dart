import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io','api/v1/teams'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
