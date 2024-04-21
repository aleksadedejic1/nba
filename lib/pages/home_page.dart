import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nba_api_app/component/Tile.dart';
import 'package:nba_api_app/model/player.dart';
import 'package:nba_api_app/model/teams.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Teams> teams = [];
  List<Players> players = [];

  // get teams
  Future getTeams() async {
    var response = await http.get(
      Uri.https(
        'api.balldontlie.io',
        '/v1/teams',
      ),
      headers: {"Authorization": "f70bff73-499b-4562-9f20-122b151a788e"},
    );
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Teams(
          abbreviation: eachTeam['abbreviation'],
          conference: eachTeam['conference'],
          division: eachTeam['division'],
          full_name: eachTeam['full_name']);
      teams.add(team);
    }
    print(teams.length);
  }

  // get player
  Future getPlayers() async {
    var responsePLayer = await http.get(
      Uri.https(
        'api.balldontlie.io',
        '/v1/players',
      ),
      headers: {"Authorization": "f70bff73-499b-4562-9f20-122b151a788e"},
    );
    var jsonData = jsonDecode(responsePLayer.body);

    for (var eachTeams in jsonData['data']) {
      final player = Players(
          position: eachTeams['position'],
          country: eachTeams['country'],
          first_name: eachTeams['first_name'],
          last__name: eachTeams['last_name'],
          );
      players.add(player);
    }
    print(players.length);
  }

  @override
  Widget build(BuildContext context) {
    getTeams();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'NBA',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Text('Teams',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1.5)),
                Text('Players',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1.5)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Teams
              FutureBuilder(
                  future: getTeams(),
                  builder: (context, snapshot) {
                    // done loading
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: teams.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(12)),
                                child: MyListTile(
                                  title: Text(teams[index].abbreviation),
                                  subtitle: Text("Full name: " +
                                      teams[index].full_name +
                                      ', ' +
                                      'Conference: ' +
                                      teams[index].conference),
                                ),
                              ),
                            );
                          });
                    }
                    // loading indicator
                    else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                  }),

              // Players
               FutureBuilder(
                  future: getPlayers(),
                  builder: (context, snapshot) {
                    // done loading
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: players.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(12)),
                                child: MyListTile(
                                  title: Text(players[index].first_name + ' ' + players[index].last__name),
                                  subtitle: Text("Position: " +
                                      players[index].position +
                                      ', ' +
                                      'Country: ' +
                                      players[index].country),
                                ),
                              ),
                            );
                          });
                    }
                    // loading indicator
                    else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                  }),
            ],
          )),
    );
  }
}
