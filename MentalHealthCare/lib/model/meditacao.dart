import 'package:flutter/material.dart';

class Meditacao extends StatefulWidget {
  @override
  _MeditacaoState createState() => _MeditacaoState();
}

class _MeditacaoState extends State<Meditacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditação"),
        centerTitle: true,
      ),
    );
  }
}
