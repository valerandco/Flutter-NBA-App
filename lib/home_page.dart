import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/team.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Team> teams = [];

  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io','api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']){
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
    
    print(teams.length);
  }

  @override
  Widget build(BuildContext context) {
    getTeams();
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: FutureBuilder(
        future: getTeams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(teams[index].abbreviation),
                      subtitle: Text(teams[index].city),
                    ),
                  ),
                );
              },
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),

    );
  }
}
