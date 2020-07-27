import 'package:flutter/material.dart';

class InfoMeditacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meditação",
        ),
        backgroundColor: Colors.brown[900],
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/papel.jpeg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          ListView(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            children: <Widget>[
              Text(
                "O que é Meditação",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "   A meditação é uma técnica que desenvolve habilidades como a concentração, tranquilidade e o foco no presente. Trata-se de uma prática ancestral, com raízes na sociedade oriental.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "   Quando pensamos em meditação, já nos vem à cabeça imagens de grandes mestres budistas, ou de pessoas com grande disciplina emocional. Mas na verdade, está muito longe disso. A técnica é acessível, e você pode incorporá-la de diversas maneiras em sua rotina.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "   Quando meditamos, acabamos \"aquietando\" a mente e criando ferramentas internas para lidar com o estresse do mundo, onde nossos sentidos são muitas vezes influenciados negativamente. ",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "   Além do alívio temporário de sentimentos prejudiciais, como estresse e ansiedade, a meditação transforma a nossa maneira de interagir com o mundo, trazendo à tona o melhor de nossa personalidade.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Meditação",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "   Existem várias formas de meditação, porém o ato de meditar é independente de crença ou religião, mesmo sendo ateu pode-se praticar, A técnica aqui apresentada é o ZAZEN.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "   O ZAZEN (Zen-budista) pode ser praticado por qualquer pessoa independente de crença. \"ZA\" significa sentar-se e \"ZEN\" significa um estado de consentração profundo",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
