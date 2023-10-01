import 'package:flutter/material.dart';
import 'package:rollcall/aulaAlu.dart';
import 'package:firebase_database/firebase_database.dart';

class telaAluno extends StatefulWidget {

  final String recebido;
  const telaAluno(this.recebido, {Key? key}) : super(key: key);

  @override
  _telaAlunoState createState() => _telaAlunoState();
}

String mat1 = '';
String mat2 = '';
String mat3 = '';
String mat4 = '';
String nome = '';

var arquivo;

class _telaAlunoState extends State<telaAluno>{

  @override
  void initState(){
    super.initState();
    conexao();
  }

  Future<void> conexao() async {

    String consulta = '';
    consulta = widget.recebido;
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('aMaterias/$consulta/mat1').get();
    final snapshot2 = await ref.child('aMaterias/$consulta/mat2').get();
    final snapshot3 = await ref.child('aMaterias/$consulta/mat3').get();
    final snapshot4 = await ref.child('aMaterias/$consulta/mat4').get();
    final snapshot11 = await ref.child('login/$consulta/nome').get();

    print(snapshot.value);
    setState(() {
      mat1 = snapshot.value.toString();
      mat2 = snapshot2.value.toString();
      mat3 = snapshot3.value.toString();
      mat4 = snapshot4.value.toString();
      nome = snapshot11.value.toString();

      if(mat1 == 'null'){
        mat1 = '';
      }

      if(mat2 == 'null'){
        mat2 = '';
      }

      if(mat3 == 'null'){
        mat3 = '';
      }

      if(mat4 == 'null'){
        mat4 = '';
      }
    });

  }

  @override

  Widget build(context) {

    String transf;

    transf = widget.recebido;

    arquivo = transf;

    return Scaffold(
      appBar: AppBar(
        title: Text('RollCall - Aluno: '+ nome),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),

                  //----------------------Novo Botão 1--------------------------

                  Container(
                    width: 300,
                    child: ElevatedButton(onPressed: (){
                      String envioNome = '';
                      String envioAula = '';
                      String envioName = '';

                      envioNome = arquivo;
                      envioAula = mat1;
                      envioName = nome;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu(envioNome,envioAula,envioName))
                      );
                    }, child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                            Icons.article,
                            size: 100
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(mat1),
                            SizedBox(height: 10),
                            Text('Matéria')
                          ],
                        ),
                      ],
                    )
                    ),
                  ),
                  SizedBox(height: 20),

                  //----------------------Novo Botão 2--------------------------

                  Container(
                    width: 300,
                    child: ElevatedButton(onPressed: (){
                      String envioNome = '';
                      String envioAula = '';
                      String envioName = '';

                      envioNome = arquivo;
                      envioAula = mat2;
                      envioName = nome;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu(envioNome,envioAula,envioName))
                      );
                    }, child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                            Icons.article,
                            size: 100
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(mat2),
                            SizedBox(height: 10),
                            Text('Matéria')
                          ],
                        ),
                      ],
                    )
                    ),
                  ),
                  SizedBox(height: 20),

                  //----------------------Novo Botão 3--------------------------

                  Container(
                    width: 300,
                    child: ElevatedButton(onPressed: (){
                      String envioNome = '';
                      String envioAula = '';
                      String envioName = '';

                      envioNome = arquivo;
                      envioAula = mat3;
                      envioName = nome;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu(envioNome,envioAula,envioName))
                      );
                    }, child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                            Icons.article,
                            size: 100
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(mat3),
                            SizedBox(height: 10),
                            Text('Matéria')
                          ],
                        ),
                      ],
                    )
                    ),
                  ),
                  SizedBox(height: 20),

                  //----------------------Novo Botão 4--------------------------

                  Container(
                    width: 300,
                    child: ElevatedButton(onPressed: (){
                      String envioNome = '';
                      String envioAula = '';
                      String envioName = '';

                      envioNome = arquivo;
                      envioAula = mat4;
                      envioName = nome;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AulaAlu(envioNome,envioAula,envioName))
                      );
                    }, child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                            Icons.article,
                            size: 100
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(mat4),
                            SizedBox(height: 10),
                            Text('Matéria')
                          ],
                        ),
                      ],
                    )
                    ),
                  ),

                  //------------------------------------------------------------

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}