import 'package:MentalHealthCare/view/info_meditacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

const API_KEY = "AIzaSyCUO4z2uEzVph-JilCmcqrTvZrS0GI7VKg";

class Meditacao extends StatefulWidget {
  @override
  _MeditacaoState createState() => _MeditacaoState();
}

class _MeditacaoState extends State<Meditacao> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Meditação"),
        centerTitle: true,
        backgroundColor: Colors.brown[900],
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/papel.jpeg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Padding(
            padding: EdgeInsets.all(35.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _videos(context, index);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _videos(BuildContext context, int index) {
  String appText;
  String image;
  String description;
  switch (index) {
    case 0:
      appText = "Meditação\nGuiada";
      image = "images/mg.jpeg";
      description = "";
      break;
    case 1:
      appText = "Como Meditar?";
      image = "images/m1.jpeg";
      description = "";
      break;
    case 2:
      appText = "Porque Meditar?";
      image = "images/m2.jpeg";
      description = "";
      break;
    case 3:
      appText = "Silêncio";
      image = "images/m3.jpeg";
      description = "";
      break;
    case 4:
      appText = "Informações\nadicionais";
      image = "images/yoga.jpeg";
      description = "";
      break;
  }
  return InkWell(
    child: Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    appText,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: () {
      switch (index) {
        case 0:
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: API_KEY,
              videoUrl:
                  "https://www.youtube.com/watch?v=98x8txJlGag&list=PLZ9-9MbIebj5Pn2MOj5mPR6nCUJ94r-7F&index=4");
          break;
        case 1:
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: API_KEY,
              videoUrl:
                  "https://www.youtube.com/watch?v=pRpayFySsto&list=PLZ9-9MbIebj5Pn2MOj5mPR6nCUJ94r-7F");
          break;
        case 2:
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: API_KEY,
              videoUrl:
                  "https://www.youtube.com/watch?v=SYJogxlkYnE&list=PLZ9-9MbIebj5Pn2MOj5mPR6nCUJ94r-7F&index=2");
          break;
        case 3:
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: API_KEY,
              videoUrl:
                  "https://www.youtube.com/watch?v=xnTBhgj0-_E&list=PLZ9-9MbIebj5Pn2MOj5mPR6nCUJ94r-7F&index=3");
          break;
        case 4:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InfoMeditacao()));
          break;
      }
    },
  );
}
