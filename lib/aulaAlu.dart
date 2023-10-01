import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AulaAlu extends StatefulWidget {

  final String recLogin;
  final String recAula;
  final String recNome;
  const AulaAlu(this.recLogin,this.recAula,this.recNome,{Key? key}) : super(key: key);

  @override

  _AulaAluState createState() => _AulaAluState();
}

bool acionaChamada = false;
bool acionado = false;
String qAviso = 'Pressione o Botão para responder a chamada!';

class _AulaAluState extends State<AulaAlu> {

  @override

  void initState(){
    super.initState();
    conexao();
    acionado = false;
  }

  late Timer reload;

  @override

  void erroDistancia(){
    setState(() {
      qAviso = 'Erro! Distãncia longe da origem!';
    });
  }

  void erroChaNainiciada(){
    setState(() {
      qAviso = 'Nenhuma chamada aberta!';
    });
  }

  void chamadaCerta(){
    setState(() {
      qAviso = "Chamada Respondida!";
    });
  }

  Future<void> conexao() async {

    String aula = '';
    String professor ='';
    String chamada = '';
    String schamada = '';

    aula = widget.recAula;

    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('materias/$aula/professor').get();
    professor = snapshot.value.toString();

    final snapshot4 = await ref.child('login/$professor/schamada').get();
    schamada = snapshot4.value.toString();

    DatabaseReference ref2 = FirebaseDatabase.instance.ref('login/$professor/chamada');
    Stream<DatabaseEvent> stream = ref2.onValue;




    stream.listen((DatabaseEvent event) {
      chamada = event.snapshot.value.toString();
      print('teste de chamada com stream por favor da certo! $chamada');
      setState(() {
        if(chamada == 'true' && schamada == aula){
          acionaChamada = true;
        }
        else{
          acionaChamada = false;
        }
      });
    });

    print(professor);
    print(chamada);
  }

  String dProfessor = '';
  Position? aPos;

  Future<void> responde() async {

    String aula='';
    String professor = '';


    aula = widget.recAula.toString();
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('materias/$aula/professor').get();
    professor = snapshot.value.toString();

    final snapshot3 = await ref.child('login/$professor/latitude').get();
    String pLatitude;
    pLatitude = snapshot3.value.toString();
    double latitude = double.parse(pLatitude);

    final snapshot4 = await ref.child('login/$professor/longitude').get();
    String pLongitude;
    pLongitude = snapshot4.value.toString();
    double longitude = double.parse(pLongitude);

    await localizacao();

    double? aLatitude;
    double? aLongitude;
    aLatitude = await aPos?.latitude.toDouble();
    aLongitude = await aPos?.longitude.toDouble();


    double distancia = await Geolocator.distanceBetween(latitude, longitude, aLatitude!, aLongitude!);

    print('$distancia teste');

    if(acionado == true && distancia <= 30){
      String nome='';
      String aula='';
      String professor = '';
      String sala = '';
      String numeracao = '';
      nome = widget.recLogin.toString();
      aula = widget.recAula.toString();
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      final snapshot3 = await ref.child('login/$nome/numeracao').get();
      numeracao = snapshot3.value.toString();
      final snapshot = await ref.child('materias/$aula/professor').get();
      professor = snapshot.value.toString();
      final snapshot2 = await ref.child('login/$professor/sala').get();
      sala = snapshot2.value.toString();
      await ref.child('chamada/$sala/$numeracao').set('$nome');
    }
    else{
      erroDistancia();
    }
  }

  Future<Position> localizacao() async {
    await Geolocator.requestPermission();
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position posicao;
    //double pLatitude;
    //double pLongitude;
    posicao = await Geolocator.getCurrentPosition();
    aPos = posicao;
    //pLatitude = posicao.latitude.toDouble();
    //pLongitude = posicao.longitude.toDouble();
    //print(pLatitude);
    //print(pLongitude);
    //DatabaseReference ref = FirebaseDatabase.instance.ref();
    //await ref.child('login/$recLogin/latitude').set(pLatitude);
    //await ref.child('login/$recLogin/longitude').set(pLongitude);
    return posicao;
  }

    Widget build(context) {

      String recAula;
      String recLogin;
      String recNome;

      recAula = widget.recAula;
      recLogin = widget.recLogin;
      recNome = widget.recNome;

      print(recLogin);
      print(recAula);
      print(recNome);


    return Scaffold(
      appBar: AppBar(
        title: Text('AULA - $recAula'),
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
                Text(recNome)
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
                onPressed: acionaChamada? (){
                  setState(() {
                    if(acionado == false){
                      acionado = true;
                      responde();
                      chamadaCerta();
                    }
                    else{
                      print('BOTÃO JÁ ACIONADO!');
                      responde();
                      chamadaCerta();
                    }
                  });
                }: null,
                child: Text('RESPONDER CHAMADA')),
            SizedBox(height: 15),
            Container(
              child: Text(qAviso),
              color: Colors.grey,
              padding: EdgeInsets.all(3),
            )
          ],
        ),
      ),
    );
  }
}

