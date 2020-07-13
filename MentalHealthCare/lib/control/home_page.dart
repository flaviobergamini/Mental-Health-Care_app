import 'package:MentalHealthCare/model/agenda.dart';
import 'package:MentalHealthCare/model/exercicio.dart';
import 'package:MentalHealthCare/model/meditacao.dart';
import 'package:MentalHealthCare/model/respiracao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mental Health Care"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      backgroundColor: Colors.blue[400],
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _telas(context, index);
                }),
          ),
        ),
      ),
    );
  }
}

Widget _telas(BuildContext context, int index) {
  String appText;
  switch (index) {
    case 0:
      appText = "Agenda";
      break;
    case 1:
      appText = "Meditação";
      break;
    case 2:
      appText = "Exercícios";
      break;
    case 3:
      appText = "Respiração";
      break;
  }
  return GestureDetector(
    child: Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("images/person.png"), fit: BoxFit.cover),
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
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Agenda()));
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Meditacao()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Exercicio()));
          break;
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Respiracao()));
          break;
      }
    },
  );
}
