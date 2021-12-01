import 'package:flutter/material.dart';
import 'package:rollcall/aulaAlu1.dart';
import 'package:rollcall/aulaAlu2.dart';
import 'package:rollcall/aulaAlu3.dart';
import 'package:rollcall/aulaAlu4.dart';

class telaAluno extends StatefulWidget {
  const telaAluno({Key? key}) : super(key: key);

  @override
  _telaAlunoState createState() => _telaAlunoState();
}

class _telaAlunoState extends State<telaAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RollCall - Aluno'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80)
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu1())
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('P Lin'),
                        SizedBox(height: 10),
                        Icon(Icons.apps),
                      ],
                    )
                ),
                SizedBox(width: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80)
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu2())
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Lab BD'),
                        SizedBox(height: 10),
                        Icon(Icons.apps),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80)
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu3())
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Redes'),
                        SizedBox(height: 10),
                        Icon(Icons.apps),
                      ],
                    )
                ),
                SizedBox(width: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80)
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu4())
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Lab ES'),
                        SizedBox(height: 10),
                        Icon(Icons.apps),
                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

