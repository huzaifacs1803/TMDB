import 'package:flutter/material.dart';
import 'package:movies_assignment/SDP.dart';
class Description extends StatelessWidget {
  final String movie_title, movie_overview, realease_date,movie_poster;

  const Description({Key key, this.movie_title, this.movie_overview, this.realease_date,this.movie_poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: const Text(
          "Watch",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.adaptive.arrow_back,
            color: const Color(0xFFFFFFFF),
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: SDP.sdp(600),
        width: SDP.sdp(400),
        child: Stack(
          children:  [
            Container(
              height: SDP.sdp(320),
              width: 700,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie_poster),
                  )
              ),
            ),
            Positioned(
              top: SDP.sdp(160),
              left: SDP.sdp(30),
              right: SDP.sdp(30),
              child: FittedBox(
                child: Text(movie_title,style: TextStyle(
                  fontSize: SDP.sdp(30),
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),),
              ),
            ),
            SizedBox(height: SDP.sdp(10),),
            Positioned(
              top: SDP.sdp(200),
              left: SDP.sdp(20),
              child: FittedBox(
                child: Text('In Theaters ' + realease_date,style: TextStyle(
                  fontSize: SDP.sdp(18),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),
            Positioned(
              top: SDP.sdp(240),
                left: SDP.sdp(70),
                child: SizedBox(
                  width: SDP.sdp(130),
                  height: SDP.sdp(35),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF61C3F2)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(color: Color(0xFF61C3F2))
                            ),
                        ),),
              onPressed: () {  },
              child: const Text('Get Tickets',style: TextStyle(color: Colors.white,fontSize: 20)),
            ),
                )),
            Positioned(
                top: SDP.sdp(277),
                left: SDP.sdp(70),
                child: SizedBox(
                  width: SDP.sdp(130),
                  height: SDP.sdp(35),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Color(0xFF61C3F2))
                        ),
                      ),),
                    onPressed: () {  },
                    child: Row(
                      children: [
                        const Icon(Icons.play_circle_outline,
                          color: Colors.white ,),
                        const Text('Watch Trailer',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                )),
            Positioned(
              top: SDP.sdp(330),
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                child: Container(
                  height: SDP.sdp(400),
                  width: SDP.sdp(280),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top :SDP.sdp(15)),
                          child: Wrap(
                            children: [
                              Text(
                                'Overview',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: SDP.sdp(20),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              const Divider(color: Colors.black,),
                              Text(
                                movie_overview,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SDP.sdp(14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
