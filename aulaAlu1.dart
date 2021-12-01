import 'package:flutter/material.dart';

class AulaAlu1 extends StatefulWidget {
  const AulaAlu1({Key? key}) : super(key: key);

  @override
  _AulaAlu1State createState() => _AulaAlu1State();
}

class _AulaAlu1State extends State<AulaAlu1> {
  @override
  Widget build(BuildContext context) {
    return Tela();
  }
}

class Tela extends StatefulWidget {
  const Tela({Key? key}) : super(key: key);

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AULA 1 - ALUNO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('NOME:'),
                Text('Aluno da Silva Sauro')
              ],
            ),
            SizedBox(height: 9),
            Divider(height: 2),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Aulas dadas:'),
                Text('XX')
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Aulas com presença:'),
                Text('XX'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Aulas com falta:'),
                Text('XX'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: null,
                child: Text('RESPONDER CHAMADA'))
          ],
        ),
      ),
    );
  }
}
