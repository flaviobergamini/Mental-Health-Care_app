//import 'dart:convert';
//import 'dart:io';
//import 'dart:js_util';

import 'package:MentalHealthCare/control/Database.dart';
import 'package:MentalHealthCare/control/app_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
//import 'package:path_provider/path_provider.dart';

const API_KEY = "AIzaSyCUO4z2uEzVph-JilCmcqrTvZrS0GI7VKg";

int _cont = 0, _aux = 0;

class Exercicio extends StatefulWidget {
  @override
  _ExercicioState createState() => _ExercicioState();
}

class _ExercicioState extends State<Exercicio> {
  // ------------------------------------------------------------------------------------------
  ContactHelper bd = ContactHelper();
  AtividadeDB at = AtividadeDB();

  @override
  void initState() {
    super.initState();
    bd.getNumberAtividade().then((tam) {
      print(tam);
      if (tam <= 0) {
        at.name = "exercicio";
        at.pos = "0";
        _cont = 0;
        bd.saveAtividade(at);
      } 
      if(_cont == 0) {
        bd.getAtividade(1).then((value){
          print("Posição: ${value.pos}");
          _cont = int.parse(value.pos);
          AppBuilder.of(context).rebuild();
          });
      }
      else{
        bd.getAtividade(1).then((value){
          print("Posição: ${value.pos}");
          print("Pos cont: ${_cont}");
          });
          at.pos = "$_cont";
          at.id = 1; 
          bd.updateAtividade(at);
      }
    });
  }

  // ------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Exercícios"),
        centerTitle: true,
        backgroundColor: Colors.blue[500],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _cont = 0;
              at.pos = "$_cont";
              at.id = 1; 
              bd.updateAtividade(at);
              AppBuilder.of(context).rebuild();
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue[200],
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 35.0,
                right: 35.0,
                top: 30.0,
                bottom: screenSize.height * 0.1),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _videos(context, index);
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (screenSize.height * 0.8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircle("1", "Início", _cont, 1),
                Container(
                  height: 1.0,
                  width: 35.0,
                  color: Colors.grey[500],
                ),
                _buildCircle("2", "", _cont, 2),
                Container(
                  height: 1.0,
                  width: 35.0,
                  color: Colors.grey[500],
                ),
                _buildCircle("3", "", _cont, 3),
                Container(
                  height: 1.0,
                  width: 35.0,
                  color: Colors.grey[500],
                ),
                _buildCircle("4", "Fim", _cont, 3),
              ],
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
      appText = "Queime muitas\nCalorias";
      image = "images/e1.jpeg";
      description = "";
      break;
    case 1:
      appText = "Aerohiit";
      image = "images/e2.jpeg";
      description = "";
      break;
    case 2:
      appText = "20 minutos de\nexercícios";
      image = "images/e3.jpeg";
      description = "";
      break;
    case 3:
      appText = "Pra se livrar da\nansiedade";
      image = "images/e4.jpeg";
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
              videoUrl: "https://www.youtube.com/watch?v=XW9IZfHiVZM");
          _cont++;
          break;
        case 1:
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: API_KEY,
              videoUrl: "https://www.youtube.com/watch?v=KwxCuTuknMk");
          _cont++;
          break;
        case 2:
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: API_KEY,
              videoUrl:
                  "https://www.youtube.com/watch?v=98eCqxrNBk8&feature=youtu.be");
          _cont++;
          break;
        case 3:
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: API_KEY,
              videoUrl: "https://www.youtube.com/watch?v=A4tkULKy7RY&t=1s");
          _cont++;
          break;
      }

      AppBuilder.of(context).rebuild();
    },
  );
}

Widget _buildCircle(String title, String subtitle, int status, int thisStatus) {
  Color backColor;
  Widget child;

  if (status < thisStatus) {
    backColor = Colors.grey[500];
    child = Text(
      title,
      style: TextStyle(color: Colors.white),
    );
  } else if (status == thisStatus) {
    backColor = Colors.blue;
    child = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ],
    );
  } else {
    backColor = Colors.green;
    child = Icon(Icons.check, color: Colors.white);
  }

  return Column(
    children: <Widget>[
      CircleAvatar(
        radius: 20.0,
        backgroundColor: backColor,
        child: child,
      ),
      Text(subtitle)
    ],
  );
}
