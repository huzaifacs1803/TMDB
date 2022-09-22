import 'package:flutter/material.dart';
import 'package:movies_assignment/description_screen.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'upcomingmovies.dart';
import 'CustomSearchDelegate.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMBD Movies',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
     watchpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          InkWell(
        onTap: (){
      showSearch(
        context: context,
        delegate: CustomSearchDelegate(
          searchmovies: Constants.movies
           ),
      );},
            child: const Icon(Icons.search,
            color: Color(0xFF202C43) ,),
          ),
        ],
        leading: const Center(
          child: Text(
            "Watch",
            style: TextStyle(
              color: Color(0xFF202C43),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: pages[0],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF2E2739),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
              });
            },
            icon: pageIndex == 1
                ? const ImageIcon(
              AssetImage("asssets/dashboard.png"),
              color: Colors.white,
              size: 50,
            )
                : const ImageIcon(
              AssetImage("asssets/dashboard.png"),
              color: Colors.white30,
              size: 50,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
            },
            icon: pageIndex == 0
                ? const ImageIcon(
              AssetImage("asssets/Vector.png"),
              color: Colors.white,
              size: 50,
            )
                : const ImageIcon(
              AssetImage("asssets/Vector.png"),
              color: Colors.white30,
              size: 50,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
            },
            icon: pageIndex == 2
                ? const ImageIcon(
              AssetImage("asssets/medialib.png"),
              color: Colors.white,
              size: 50,
            )
                : const ImageIcon(
              AssetImage("asssets/medialib.png"),
              color: Colors.white30,
              size: 50,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
            },
            icon: pageIndex == 3
                ? const ImageIcon(
              AssetImage("asssets/List.png"),
              color: Colors.white,
              size: 50,
            )
                : const ImageIcon(
              AssetImage("asssets/List.png"),
              color: Colors.white,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class watchpage extends StatefulWidget {

  @override
  State<watchpage> createState() => _watchpageState();
}

class _watchpageState extends State<watchpage> {


  List upcomingmovieslist=[];
  final String api='51377b048bb59a5ffd296be005e86576';
  final String accesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MTM3N2IwNDhiYjU5YTVmZmQyOTZiZTAwNWU4NjU3NiIsInN1YiI6IjYzMmFlMWUxYmE0ODAyMDA3Yzc1MTRjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1Yixa6VSibGDN5-pqtEGh2bkiGTfCIx3M84TKFssUdA';
  @override
  void initState(){
    loadmovies();
  }
  loadmovies()async{
    TMDB tmdbcustom=TMDB(ApiKeys(api,accesstoken),logConfig: const ConfigLogger(
      showLogs:true,
      showErrorLogs: true,
    ));
    Map upcomingmovies = await tmdbcustom.v3.movies.getUpcoming();
    setState(() {
    upcomingmovieslist=upcomingmovies['results'];
    Constants.movies=upcomingmovieslist;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(top: 30.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF6F6FA)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 10),
          child: ListView.builder(itemCount: upcomingmovieslist.length,scrollDirection : Axis.vertical,itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Description(movie_overview: upcomingmovieslist[index]['overview'],movie_title: upcomingmovieslist[index]['title'],realease_date: upcomingmovieslist[index]['release_date'],movie_poster: 'https://image.tmdb.org/t/p/w500' + upcomingmovieslist[index]['backdrop_path'],)),
                );        },
              child: SizedBox(
                height: 270,
                width: 500,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 900,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://image.tmdb.org/t/p/w500' + upcomingmovieslist[index]['poster_path'])
                        )
                      ),
                    ),
                    Positioned(
                      top: 170,
                        child: FittedBox(
                          child: Text(upcomingmovieslist[index]['title'],style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        )
                    ),
                  ],

                ),

              ),
            );
          },),
        ),
      ),
    );
  }
}
