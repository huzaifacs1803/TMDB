
import 'package:flutter/material.dart';
import 'package:movies_assignment/SDP.dart';

import 'description_screen.dart';


class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({this.searchmovies});
  List searchmovies = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Color(0xFF202C43),),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:  const Icon(Icons.search, color: Color(0xFF202C43)),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    for (var language in searchmovies) {
      if (language.toString().contains(query.toLowerCase())) {
        matchQuery.add(language);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index]['title'];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(SDP.sdp(10))),
            color: Colors.white,
          ),
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Description(movie_overview: matchQuery[index]['overview'],movie_title: matchQuery[index]['title'],realease_date: matchQuery[index]['release_date'],movie_poster: 'https://image.tmdb.org/t/p/w500' + matchQuery[index]['backdrop_path'],)),
                );
              },
              child: Padding(
                padding:  EdgeInsets.only(top :SDP.sdp(10),bottom:SDP.sdp(10) ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      height: SDP.sdp(70),
                      width: SDP.sdp(80),
                      image: NetworkImage('https://image.tmdb.org/t/p/w500' + matchQuery[index]['poster_path'],),
                    ),
                    Center(
                      child: FittedBox(
                        child: Text(
                          results,
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    SDP.init(context);
    List matchQuery = [];
    for (var language in searchmovies) {
      if (language.toString().contains(query.toLowerCase())) {
        matchQuery.add(language);
      }
    }
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            children: <Widget>[
              Categories('Darama','darama',),
              Categories('Family','family'),
              Categories('Comedy','comedy'),
              Categories('Crime','crime'),
              Categories('Advanture','advanture'),
              Categories('Darama','darama',),
              Categories('Family','family'),
              Categories('Comedy','comedy'),
              Categories('Crime','crime'),
              Categories('Advanture','advanture'),

            ],
          ),
        ),
      ],
    );
  }

  Container Categories(String categoryname,String categoryimagename) {
    return Container(
              padding:  EdgeInsets.all(SDP.sdp(2)),
              child: Stack(
                children: [
                  Container(
                    height: SDP.sdp(360),
                    width: SDP.sdp(400),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asssets/$categoryimagename.png")
                        )
                    ),
                  ),
                  Positioned(
                      top: 100,
                      child: FittedBox(
                        child: Text(categoryname,style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                      )
                  ),
                ],
              ),
            );
  }
}
