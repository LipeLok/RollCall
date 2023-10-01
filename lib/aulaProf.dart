import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class AulaProf extends StatefulWidget {
  final String recLogin;
  final String recAula;
  final String recNome;
  const AulaProf(this.recLogin,this.recAula,this.recNome,{Key? key}) : super(key: key);

  @override
  _AulaProfState createState() => _AulaProfState();
}

String imgAlu1 = 'assets/imagens/menina1.png';
String imgAlu2 = 'assets/imagens/menina2.png';
String imgAlu3 = 'assets/imagens/menina3.png';
String imgAlu4 = 'assets/imagens/menina4.png';
String imgAlu5 = 'assets/imagens/menina5.png';
String imgAlu6 = 'assets/imagens/menino1.png';
String imgAlu7 = 'assets/imagens/menino2.png';
String imgAlu8 = 'assets/imagens/menino3.png';
String imgAlu9 = 'assets/imagens/menino4.png';
String imgAlu10 = 'assets/imagens/menino5.png';

bool chamada = false;

class _AulaProfState extends State<AulaProf> {

  @override

  void initState(){
    super.initState();
    consulta();
  }

  String aviso = '';

  void chamadaIniciada(){
    setState(() {
      aviso = 'Chamada Iniciada!';
    });
  }

  void erroChamada(){
    setState(() {
      aviso = 'ERRO! Chamada Ja iniciada.';
    });
  }

  void finalizaChamada(){
    setState(() {
      aviso = 'Chamada Finalizada!';
    });
  }

  void cancelaChamada(){
    setState(() {
      aviso = 'Chamada Cancelada.';
    });
  }

  void chamadaConflito(){
    setState(() {
      aviso = 'Não há uma chamada aberta.';
    });
  }

  DatabaseReference ref = FirebaseDatabase.instance.ref();

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
    double pLatitude;
    double pLongitude;
    posicao = await Geolocator.getCurrentPosition();
    pLatitude = posicao.latitude.toDouble();
    pLongitude = posicao.longitude.toDouble();
    print(pLatitude);
    print(pLongitude);

    String login = '';

    login = widget.recLogin.toString();


    await ref.child('login/$login/latitude').set(pLatitude);
    await ref.child('login/$login/longitude').set(pLongitude);
    return posicao;
  }


  Future<void> consulta() async {

    String login = '';
    login = widget.recLogin.toString();

    final snapshotp = await ref.child('login/$login/sala').get();
    String sala = '';
    sala = snapshotp.value.toString();
    print(sala);

    DatabaseReference ref2 = FirebaseDatabase.instance.ref('login/$login/chamada');
    Stream<DatabaseEvent> stream2 = ref2.onValue;

    String testChamada = '';

    stream2.listen((DatabaseEvent event) {
      testChamada = event.snapshot.value.toString();
    });

    //----------------------- Stream aluno1 -----------------------------

    String valor = '';
    final ref100 = FirebaseDatabase.instance.ref();
    final snapshot200 = await ref100.child('chamada/$sala/aluno1').get();
    valor = snapshot200.value.toString();
    print('consulta BCO $valor');

    DatabaseReference ref3 = FirebaseDatabase.instance.ref('chamada/$sala/aluno1');
    Stream<DatabaseEvent> stream3 = ref3.onValue;

    String testImagem1 = '';
    print("teste de imagem 1 $testImagem1");
    stream3.listen((DatabaseEvent event) {
      testImagem1 = event.snapshot.value.toString();
      print('antes do set state $testImagem1');

      setState(() {
        print('no set state por alguma razão mudou $testImagem1');
        print('teste de chamada $testChamada');

        if(testImagem1 != '' && testChamada == 'true'){
          if(testImagem1 != 'null' && testChamada == 'true'){
            imgAlu1 = 'assets/imagens/menina1p.png';
          }
        }
        else{
          imgAlu1 = 'assets/imagens/menina1.png';
        }
        // if(testImagem1 == "" || testImagem1 == null){
        //   if(testChamada == 'true'){
        //     imgAlu1 = 'assets/imagens/menina1p.png';
        //     print('CHAMOU TRUE $testImagem1');
        //   }
        // }
        // else{
        //   imgAlu1 = 'assets/imagens/menina1.png';
        //   print('CHAMOU FALSE $testImagem1');
        //
        // }
      });
    });

    //----------------------- Stream aluno2 -----------------------------

    DatabaseReference ref4 = FirebaseDatabase.instance.ref('chamada/$sala/aluno2');
    Stream<DatabaseEvent> stream4 = ref4.onValue;

    String testImagem2 = '';

    stream4.listen((DatabaseEvent event) {
      testImagem2 = event.snapshot.value.toString();
      setState(() {
        if(testImagem2 != '' && testChamada == 'true'){
          if(testImagem2 != 'null' && testChamada == 'true'){
            imgAlu2 = 'assets/imagens/menina2p.png';
          }
        }
        else{
          imgAlu2 = 'assets/imagens/menina2.png';
        }
      });
    });

    //----------------------- Stream aluno3 -----------------------------

    DatabaseReference ref5 = FirebaseDatabase.instance.ref('chamada/$sala/aluno3');
    Stream<DatabaseEvent> stream5 = ref5.onValue;

    String testImagem3 = '';

    stream5.listen((DatabaseEvent event) {
      testImagem3 = event.snapshot.value.toString();
      setState(() {
        if(testImagem3 != '' && testChamada == 'true'){
          if(testImagem3 != 'null' && testChamada == 'true'){
            imgAlu3 = 'assets/imagens/menina3p.png';
          }
        }
        else{
          imgAlu3 = 'assets/imagens/menina3.png';
        }
      });
    });

    //----------------------- Stream aluno4 -----------------------------

    DatabaseReference ref6 = FirebaseDatabase.instance.ref('chamada/$sala/aluno4');
    Stream<DatabaseEvent> stream6 = ref6.onValue;

    String testImagem4 = '';

    stream6.listen((DatabaseEvent event) {
      testImagem4 = event.snapshot.value.toString();
      setState(() {
        if(testImagem4 != '' && testChamada == 'true'){
          if(testImagem4 != 'null' && testChamada == 'true'){
            imgAlu4 = 'assets/imagens/menina4p.png';
          }
        }
        else{
          imgAlu4 = 'assets/imagens/menina4.png';
        }
      });
    });

    //----------------------- Stream aluno5 -----------------------------

    DatabaseReference ref7 = FirebaseDatabase.instance.ref('chamada/$sala/aluno5');
    Stream<DatabaseEvent> stream7 = ref7.onValue;

    String testImagem5 = '';

    stream7.listen((DatabaseEvent event) {
      testImagem5 = event.snapshot.value.toString();
      setState(() {
        if(testImagem5 != '' && testChamada == 'true'){
          if(testImagem5 != 'null' && testChamada == 'true'){
            imgAlu5 = 'assets/imagens/menina5p.png';
          }
        }
        else{
          imgAlu5 = 'assets/imagens/menina5.png';
        }
      });
    });

    //----------------------- Stream aluno6 -----------------------------

    DatabaseReference ref8 = FirebaseDatabase.instance.ref('chamada/$sala/aluno6');
    Stream<DatabaseEvent> stream8 = ref8.onValue;

    String testImagem6 = '';

    stream8.listen((DatabaseEvent event) {
      testImagem6 = event.snapshot.value.toString();
      setState(() {
        if(testImagem6 != '' && testChamada == 'true'){
          if(testImagem6 != 'null' && testChamada == 'true'){
            imgAlu6 = 'assets/imagens/menino1p.png';
          }
        }
        else{
          imgAlu6 = 'assets/imagens/menino1.png';
        }
      });
    });

    //----------------------- Stream aluno7 -----------------------------

    DatabaseReference ref9 = FirebaseDatabase.instance.ref('chamada/$sala/aluno7');
    Stream<DatabaseEvent> stream9 = ref9.onValue;

    String testImagem7 = '';

    stream9.listen((DatabaseEvent event) {
      testImagem7 = event.snapshot.value.toString();
      setState(() {
        if(testImagem7 != '' && testChamada == 'true'){
          if(testImagem7 != 'null' && testChamada == 'true'){
            imgAlu7 = 'assets/imagens/menino2p.png';
          }
        }
        else{
          imgAlu7 = 'assets/imagens/menino2.png';
        }
      });
    });

    //----------------------- Stream aluno8 -----------------------------

    DatabaseReference ref10 = FirebaseDatabase.instance.ref('chamada/$sala/aluno8');
    Stream<DatabaseEvent> stream10 = ref10.onValue;

    String testImagem8 = '';

    stream10.listen((DatabaseEvent event) {
      testImagem8 = event.snapshot.value.toString();
      setState(() {
        if(testImagem8 != '' && testChamada == 'true'){
          if(testImagem8 != 'null' && testChamada == 'true'){
            imgAlu8 = 'assets/imagens/menino3p.png';
          }
        }
        else{
          imgAlu8 = 'assets/imagens/menino3.png';
        }
      });
    });

    //----------------------- Stream aluno9 -----------------------------

    DatabaseReference ref11 = FirebaseDatabase.instance.ref('chamada/$sala/aluno9');
    Stream<DatabaseEvent> stream11 = ref11.onValue;

    String testImagem9 = '';

    stream11.listen((DatabaseEvent event) {
      testImagem9 = event.snapshot.value.toString();
      setState(() {
        if(testImagem9 != '' && testChamada == 'true'){
          if(testImagem9 != 'null' && testChamada == 'true'){
            imgAlu9 = 'assets/imagens/menino4p.png';
          }
        }
        else{
          imgAlu9 = 'assets/imagens/menino4.png';
        }
      });
    });

    //----------------------- Stream aluno10 -----------------------------

    DatabaseReference ref12 = FirebaseDatabase.instance.ref('chamada/$sala/aluno10');
    Stream<DatabaseEvent> stream12 = ref12.onValue;

    String testImagem10 = '';

    stream12.listen((DatabaseEvent event) {
      testImagem10 = event.snapshot.value.toString();
      setState(() {
        if(testImagem10 != '' && testChamada == 'true'){
          if(testImagem10 != 'null' && testChamada == 'true'){
            imgAlu10 = 'assets/imagens/menino5p.png';
          }
        }
        else{
          imgAlu10 = 'assets/imagens/menino5.png';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

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
          title: Text('AULA: $recAula - PROFESSOR: $recNome'),
          centerTitle: true
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: 05),
              // TextField(
              //     controller: data,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'Insira o dia e mês: DDMM',
              //     )
              // ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu1)),
                  SizedBox(width: 20),
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu2)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu3)),
                  SizedBox(width: 20),
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu4)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu5)),
                  SizedBox(width: 20),
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu6)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu7)),
                  SizedBox(width: 20),
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu8)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu9)),
                  SizedBox(width: 20),
                  Container(width: 100,color: Colors.grey,child: Image.asset(imgAlu10)),
                ],
              ),
              SizedBox(height: 20),
              Text(aviso),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () async {
                        if(chamada == true){
                          print('chamada já iniciada');
                          erroChamada();
                        }
                        else{
                          chamada = true;
                          var diaAula = new DateTime.now();
                          var formatado = new DateFormat('ddMMyyyy-HHmm');
                          String dataCerta = formatado.format(diaAula);
                          String codAula = '';

                          codAula = ("$dataCerta$recAula");
                          //chamada = true;
                          //String dia = '';
                          //dia = data.text;
                          await ref.child('login/$recLogin/chamada').set(true);
                          await ref.child('login/$recLogin/sala').set('$codAula');
                          await ref.child('login/$recLogin/schamada').set('$recAula');


                          print('sucedido');
                          chamadaIniciada();
                        }
                        setState(() {
                          localizacao();
                        });
                      },
                      child: Text('INICIAR CHAMADA')
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue[900])
                      ),
                      onPressed: () async {
                        if(chamada == false){
                          print('Não há chamada aberta');
                          chamadaConflito();
                        }
                        else{
                          chamada = false;
                          await ref.child('login/$recLogin/chamada').set(false);

                          await ref.child('login/$recLogin/latitude').set(0);
                          await ref.child('login/$recLogin/longitude').set(0);
                          await ref.child('login/$recLogin/sala').set('nenhuma');
                          await ref.child('login/$recLogin/schamada').set('false');
                          finalizaChamada();
                        }
                        setState(() {
                          consulta();
                        });
                      },
                      child: Text('FINALIZAR CHAMADA')
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  onPressed: () async {
                    chamada = false;
                    await ref.child('login/$recLogin/chamada').set(false);
                    await ref.child('login/$recLogin/schamada').set('false');
                    await ref.child('login/$recLogin/latitude').set(0);
                    await ref.child('login/$recLogin/longitude').set(0);
                    await ref.child('login/$recLogin/sala').set('nenhuma');
                    print('cancelado');
                    cancelaChamada();
                    consulta();
                  },
                  child: Text('CANCELAR CHAMADA')
              ),
            ],
          ),

        ),
      ),
    );
  }
}

// while(contador == true){
// Timer.periodic(new Duration(seconds: 5), (timer) {
// if(contador == false) return;
//
// });
// }

// Future<void> atualiza() async {
//   print('dentro do loop');
//   final snapshot = await ref.child('chamada/$recAula/aluno1').get();
//   print('$aluno1-teste de resultado do aluno1');
//   if(snapshot.value.toString() == true){
//     aluno1 = true;
//     print('entrando no true');
//   }
//   else{
//     aluno1 = false;
//   }
//   final snapshot2 = await ref.child('chamada/$recAula/aluno2').get();
//   if(snapshot2.value.toString() == true){
//     aluno2 = true;
//   }
//   else{
//     aluno2 = false;
//   }
//   final snapshot3 = await ref.child('chamada/$recAula/aluno3').get();
//   if(snapshot3.value.toString() == true){
//     aluno3 = true;
//   }
//   else{
//     aluno3 = false;
//   }
//   final snapshot4 = await ref.child('chamada/$recAula/aluno4').get();
//   if(snapshot4.value.toString() == true){
//     aluno4 = true;
//   }
//   else{
//     aluno4 = false;
//   }
//   final snapshot5 = await ref.child('chamada/$recAula/aluno5').get();
//   if(snapshot5.value.toString() == true){
//     aluno5 = true;
//   }
//   else{
//     aluno5 = false;
//   }
//   final snapshot6 = await ref.child('chamada/$recAula/aluno6').get();
//   if(snapshot6.value.toString() == true){
//     aluno6 = true;
//   }
//   else{
//     aluno6 = false;
//   }
//   final snapshot7 = await ref.child('chamada/$recAula/aluno7').get();
//   if(snapshot7.value.toString() == true){
//     aluno7 = true;
//   }
//   else{
//     aluno7 = false;
//   }
//   final snapshot8 = await ref.child('chamada/$recAula/aluno8').get();
//   if(snapshot8.value.toString() == true){
//     aluno8 = true;
//   }
//   else{
//     aluno8 = false;
//   }
//   final snapshot9 = await ref.child('chamada/$recAula/aluno9').get();
//   if(snapshot9.value.toString() == true){
//     aluno9 = true;
//   }
//   else{
//     aluno9 = false;
//   }
//   final snapshot10 = await ref.child('chamada/$recAula/aluno10').get();
//   if(snapshot10.value.toString() == true){
//     aluno10 = true;
//   }
//   else{
//     aluno10 = false;
//   }
//   //DECLARAÇÃO DE MUDANÇA DE IMAGENS
//   if(aluno1 == true){
//     imgAlu1 = 'imagens/menina1p.png';
//     print('reload2');
//   }
//   else{
//     imgAlu1 = 'imagens/menina1.png';
//     print('reload3');
//   }
//
//   if(aluno2 == true){
//     imgAlu2 = 'imagens/menina2p.png';
//   }
//   else{
//     imgAlu2 = 'imagens/menina2.png';
//   }
//
//   if(aluno3 == true){
//     imgAlu3 = 'imagens/menina3p.png';
//   }
//   else{
//     imgAlu3 = 'imagens/menina3.png';
//   }
//
//   if(aluno4 == true){
//     imgAlu4 = 'imagens/menina4p.png';
//   }
//   else{
//     imgAlu4 = 'imagens/menina4.png';
//   }
//
//   if(aluno5 == true){
//     imgAlu5 = 'imagens/menina5p.png';
//   }
//   else{
//     imgAlu5 = 'imagens/menina5.png';
//   }
//
//   if(aluno6 == true){
//     imgAlu6 = 'imagens/menina6p.png';
//   }
//   else{
//     imgAlu6 = 'imagens/menina6.png';
//   }
//
//   if(aluno7 == true){
//     imgAlu7 = 'imagens/menina7p.png';
//   }
//   else{
//     imgAlu7 = 'imagens/menina7.png';
//   }
//
//   if(aluno8 == true){
//     imgAlu8 = 'imagens/menina8p.png';
//   }
//   else{
//     imgAlu8 = 'imagens/menina8.png';
//   }
//
//   if(aluno9 == true){
//     imgAlu9 = 'imagens/menina9p.png';
//   }
//   else{
//     imgAlu9 = 'imagens/menina9.png';
//   }
//
//   if(aluno10 == true){
//     imgAlu10 = 'imagens/menina10p.png';
//   }
//   else{
//     imgAlu10 = 'imagens/menina10.png';
//   }
// }

// Timer reload;
//
// reload = Timer.periodic(Duration(seconds: 3), (Timer t){
//   print('RELOAD');
//   setState(() {
//     atualiza();
//     print('teste de print no loop');
//   });
// });