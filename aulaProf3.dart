import 'package:flutter/material.dart';

class aula3 extends StatefulWidget {
  const aula3({Key? key}) : super(key: key);

  @override
  _aula3State createState() => _aula3State();
}

class _aula3State extends State<aula3> {
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
        title: Text('AULA 3 - PROFESSOR '),
        centerTitle: true
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //aluno: Linha 1, Coluna 1
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 1, Coluna 2
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 1, Coluna 3
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 1, Coluna 4
                _botao('aluno')
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //aluno: Linha 2, Coluna 1
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 2, Coluna 2
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 2, Coluna 3
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 2, Coluna 4
                _botao('aluno'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //aluno: Linha 3, Coluna 1
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 3, Coluna 2
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 3, Coluna 3
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 3, Coluna 4
                _botao('aluno')
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //aluno: Linha 4, Coluna 1
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 4, Coluna 2
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 4, Coluna 3
                _botao('aluno'),
                SizedBox(width: 20),
                //aluno: Linha 4, Coluna 4
                _botao('aluno')
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: (){},
                    child: Text('INICIAR CHAMADA')
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[900])
                    ),
                    onPressed: (){},
                    child: Text('FINALIZAR CHAMADA')
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                onPressed: (){},
                child: Text('CANCELAR CHAMADA')
            ),
          ],
        ),
      ),
    );
  }


  ElevatedButton _botao(texto){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        minimumSize: Size(60, 60)
    ),
        onPressed: null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
                Icons.account_circle_outlined
            ),
            Text(texto)
          ],
        )
    );
  }
}


