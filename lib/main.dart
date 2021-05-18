import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int firstnum;
  int secnum;
  String texttodisplay = "";
  String res;
  String operatortoPerform;
  void buttonClicked(String buttonVal){
    if(buttonVal== "C" || buttonVal== "AC"){
      texttodisplay = "";
      firstnum = 0;
      secnum = 0;
      res= "";
    }
    else if(buttonVal == "+" || buttonVal == "-" || buttonVal == "X"|| buttonVal == "/"){
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoPerform = buttonVal;
    }
    else if(buttonVal == "="){
      secnum = int.parse(texttodisplay);
      if(operatortoPerform== "+"){
        res = (firstnum + secnum).toString();
      }
      if(operatortoPerform== "-"){
        res = (firstnum - secnum).toString();
      }
      if(operatortoPerform== "X"){
        res = (firstnum * secnum).toString();
      }
      if(operatortoPerform== "/"){
        res = (firstnum / secnum).toString();
      }
      if(operatortoPerform== "%"){
        res = (firstnum % secnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay + buttonVal).toString();
    }
    setState(() {
      texttodisplay = res;
    });

  }
  Widget customButton(String buttonVal){
    return Expanded(

      child: OutlineButton(
        padding: EdgeInsets.all(25),
        onPressed: ()=> buttonClicked(buttonVal),
        child: Text(
          "$buttonVal",
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283637),
      // appBar: AppBar(
      //   title: Text(
      //     'Calculator'
      //   ),
      // ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child:Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF545F61),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.bottomRight,
                 child: Text('$texttodisplay',style: TextStyle(
                   color: Colors.white,
                   fontSize: 25,
                     fontWeight: FontWeight.w600
                 ),),
                )),
            Row(
              children:<Widget>[
                customButton("AC"),
                customButton('C'),
                customButton('%'),
                customButton('/'),
              ],
            ),
            Row(
              children:<Widget>[
                customButton("7"),
                customButton('8'),
                customButton('9'),
                customButton('X'),
              ],
            ),
            Row(
              children:<Widget>[
                customButton( '4'),
                customButton('5'),
                customButton('6'),
                customButton('-'),
              ],
            ),
            Row(
              children:<Widget>[
                customButton('1'),
                customButton('2'),
                customButton('3'),
                customButton('+'),
              ],
            ),
            Row(
              children:<Widget>[
                customButton('.'),
                customButton('0'),
                customButton('00'),
                customButton('='),
              ],
            )
          ],
        ),
      ),
    );
  }
}


