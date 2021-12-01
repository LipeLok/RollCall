import 'package:flutter/material.dart';

class AulaAlu4 extends StatefulWidget {
  const AulaAlu4({Key? key}) : super(key: key);

  @override
  _AulaAlu4State createState() => _AulaAlu4State();
}

class _AulaAlu4State extends State<AulaAlu4> {
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
        title: Text('AULA 4 - ALUNO'),
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
                Text('Aulas com preseça:'),
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
