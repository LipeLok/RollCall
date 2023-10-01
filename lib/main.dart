import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rollcall/telaAluno.dart';
import 'package:rollcall/telaProfessor.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'RollCall',
    options: FirebaseOptions(
      apiKey: 'apiKey',
      appId: 'appId',
      databaseURL: "https://rollcall-c378c-default-rtdb.firebaseio.com/",
      messagingSenderId: 'messagingSenderId',
      projectId: 'projectId',
    ),
  );
  runApp(MaterialApp(
      home: RollCall(),
  ));
}

class RollCall extends StatefulWidget {
  const RollCall({Key? key}) : super(key: key);
  
  @override
  _RollCallState createState() => _RollCallState();
}

class _RollCallState extends State<RollCall> {

  TextEditingController usuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  String erro = 'Realize o Login';

  void Errado(){
    setState(() {
      erro = 'Usuário ou senha incorretos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imagens/fundo.jpg"), fit: BoxFit.cover)),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 60, 0, 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/imagens/novologo.png', scale: 2),
              SizedBox(height: 20),
              SizedBox(
                child: TextField(
                    controller: usuario,
                    maxLength: 30,
                    decoration: InputDecoration(
                      fillColor: Colors.white, filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Usuario',
                      counterText: ''
                    )
                ),
                width: 300,
              ),
              SizedBox(height: 20),
              SizedBox(
                child: TextField(
                    controller: senha,
                    maxLength: 25,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      fillColor: Colors.white, filled: true,
                      counterText: '',
                      border: OutlineInputBorder(),
                      hintText: 'Senha'
                    )
                ),
                width: 300,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {

                    var user;
                    var pass;
                    var userData;
                    var userSenha;
                    var userTipo;
                    user = usuario.text;
                    pass = senha.text;

                    final ref = FirebaseDatabase.instance.ref();
                    final snapshot = await ref.child('login/$user/user').get();

                    if (snapshot.exists) {
                      userData = snapshot.value;
                    }

                    else {
                      Errado();
                    }

                    final snapshot2 = await ref.child('login/$user/senha').get();

                    if (snapshot2.exists) {
                      userSenha = snapshot2.value;
                    }

                    else {
                      Errado();
                    }

                    final snapshot3 = await ref.child('login/$user/tipo').get();

                    if (snapshot3.exists) {
                      userTipo = snapshot3.value;
                      print(userTipo+"teste nova inserção de tipo");
                    }

                    else {
                      print('No data available.');
                      Errado();
                    }

                    setState(() {
                      print(userData+'dentro do SetState');
                      print(userTipo+'dentro do setState');
                      if(userTipo == 'professor'){
                        if(user == userData && pass ==  userSenha){
                          var recebido;
                          recebido = user;
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => telaProfessor(recebido))
                          );
                        }
                        else{
                          Errado();
                        }
                      }
                      else if(userTipo == 'aluno'){

                        if(user == userData && pass ==  userSenha){
                          var recebido;
                          recebido = user;
                          print(recebido+'teste de recebido no push');
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => telaAluno(recebido))
                          );
                        }
                      }
                      else{
                        Errado();
                      }
                    });
                  },
                  child: Text('ENTRAR'),
              ),
              SizedBox(height: 10,),
              Container(
                  child: Text(erro),
                  color: Colors.grey,
                  padding: EdgeInsets.all(3),
              )
            ],
          ),
        ),
      )
    );
  }
}