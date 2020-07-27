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
          elevation: 0,
          title: Text(
            "Mental Health Care",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[300]),
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _telas(context, index);
              }),
        ),
      ),
    );
  }
}

Widget _telas(BuildContext context, int index) {
  String appText;
  String image;
  String description;
  switch (index) {
    case 0:
      appText = "Agenda";
      image = "images/agenda.jpeg";
      description = "Organize sua vida,\nfaça suas anotações";
      break;
    case 1:
      appText = "Meditação";
      image = "images/yoga.jpeg";
      description = "Rezerve um momento\n para clarear as ideias";
      break;
    case 2:
      appText = "Exercícios";
      image = "images/meditacao.jpeg";
      description = "Mantenha a saúde\n em dia";
      break;
    case 3:
      appText = "Respiração";
      image = "images/nature.jpeg";
      description = "relaxe respirando\n da menhor forma";
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
                shape: BoxShape.circle,
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
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
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
