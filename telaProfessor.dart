import 'package:flutter/material.dart';
import 'package:rollcall/aulaProf1.dart';
import 'package:rollcall/aulaProf2.dart';
import 'package:rollcall/aulaProf3.dart';
import 'package:rollcall/aulaProf4.dart';

class telaProfessor extends StatefulWidget {
  const telaProfessor({Key? key}) : super(key: key);

  @override
  _telaProfessorState createState() => _telaProfessorState();
}

class _telaProfessorState extends State<telaProfessor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RollCall - Professor'),
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
                        MaterialPageRoute(builder: (context) => aula1())
                    );
                  },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('ES1 - M'),
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
                          MaterialPageRoute(builder: (context) => aula2())
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('ES1 - N'),
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
                          MaterialPageRoute(builder: (context) => aula3())
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Lab ES - M'),
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
                          MaterialPageRoute(builder: (context) => aula4())
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Lab ES - N'),
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
