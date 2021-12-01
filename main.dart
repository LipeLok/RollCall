import 'package:flutter/material.dart';
import 'package:rollcall/telaAluno.dart';
import 'package:rollcall/telaProfessor.dart';

void main () => runApp(MaterialApp(
  home: RollCall(),
));

class RollCall extends StatefulWidget {
  const RollCall({Key? key}) : super(key: key);

  @override
  _RollCallState createState() => _RollCallState();
}

class _RollCallState extends State<RollCall> {

  TextEditingController usuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RollCall - Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
                controller: usuario,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Usuario',
                )
            ),
            SizedBox(height: 20),
            TextField(
                controller: senha,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Senha'
                )
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  String user;
                  String pass;
                  user = usuario.text;
                  pass = senha.text;
                  setState(() {
                    if(user == 'professor' && pass ==  '1234'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => telaProfessor())
                      );
                    }
                    else if (user == 'aluno' && pass ==  '1234'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => telaAluno())
                      );
                    }
                  });
                },
                child: Text('ENTRAR'),
            ),
          ],
        ),
      )
    );
  }
}
