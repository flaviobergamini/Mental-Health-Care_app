import 'package:flutter/material.dart';

class Respiracao extends StatefulWidget {
  @override
  _RespiracaoState createState() => _RespiracaoState();
}

class _RespiracaoState extends State<Respiracao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Técinicas de Respiração"),
        centerTitle: true,
      ),
    );
  }
}
