import "package:flutter/material.dart";
import 'dart:math';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    setState(() {
      co=[];
      changecolors();
      pickcolor();
    });
  }
  List<Color> co=[];
  void changecolors(){
   var rand=Random();
   List c=[];
   for(int j=0;j<6;j++)
    {
      for(int i=0;i<3;i++){
          c.add(rand.nextInt(255));
      }
        co.add(Color.fromRGBO(c[j], c[j+1], c[j+2], 1));
    }
   //return "RGB("+c[0].toString()+", "+c[1].toString()+", "+c[2].toString()+")";
  }
Color z;
String c;
void pickcolor(){
    var random=Random();
    int y=random.nextInt(6);
    z=co[y];
    int x1=int.parse(z.toString().substring(10,12),radix: 16);
    int x2=int.parse(z.toString().substring(12,14),radix: 16);
    int x3=int.parse(z.toString().substring(14,16),radix: 16);
    c="RGB("+x1.toString()+", "+x2.toString()+", "+x3.toString()+")";
}
  showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = FlatButton(  
    child: Text("OK",style: TextStyle(fontSize: 15),),  
    onPressed: () {  
      Navigator.of(context).pop();
      setState(() {
      co=[];
      changecolors();
      pickcolor();
      ans="";
      });
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Text("Correct!",style: TextStyle(fontSize: 30),),   
    actions: [  
      okButton,  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  
  Color seletedcolor=Colors.black;
  String ans="";
  void game(){
    if(seletedcolor==z){
      setState(() {
        showAlertDialog(context);
        ans="";
      });
    }
    else if(seletedcolor!=z){
     setState(() {
        ans="Try Again!";
     });
    }
    else{
      ans="";
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           Text(c,style: TextStyle(fontSize: 35)),
           RaisedButton(onPressed: (){
                  setState(() {
                    co=[];
                    changecolors();
                    pickcolor();
                    ans="";
                  });
                },
                child: Text("CHANGE COLORS"),
                color: Colors.deepPurple,
                textColor: Colors.white,),
           Text(ans,style: TextStyle(fontSize: 20)),  
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               GestureDetector(
                 onTap: (){
                   setState(() {
                     seletedcolor=co[0];
                   });
                   game();
                 },
                 child: Container(
                 width: 125,
                 height: 125,
                 decoration: BoxDecoration(
                   color: co[0],
                   borderRadius: BorderRadius.all(Radius.circular(15.0))
                 ),),
               ),
                GestureDetector(
                 onTap: (){
                   setState(() {
                     seletedcolor=co[1];
                   });
                   game();
                 },
                 child: Container(
                 width: 125,
                 height: 125,
                 decoration: BoxDecoration(
                   color: co[1],
                   borderRadius: BorderRadius.all(Radius.circular(15.0))
                 ),),
               ),
                GestureDetector(
                 onTap: (){
                   setState(() {
                     seletedcolor=co[2];
                   });
                   game();
                 },
                 child: Container(
                 width: 125,
                 height: 125,
                 decoration: BoxDecoration(
                   color: co[2],
                   borderRadius: BorderRadius.all(Radius.circular(15.0))
                 ),),
               ),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               GestureDetector(
                 onTap: (){
                   setState(() {
                     seletedcolor=co[3];
                   });
                   game();
                 },
                 child: Container(
                 width: 125,
                 height: 125,
                 decoration: BoxDecoration(
                   color: co[3],
                   borderRadius: BorderRadius.all(Radius.circular(15.0))
                 ),),
               ),
               GestureDetector(
                 onTap: (){
                   setState(() {
                     seletedcolor=co[4];
                   });
                  game();
                 },
                 child: Container(
                 width: 125,
                 height: 125,
                 decoration: BoxDecoration(
                   color: co[4],
                   borderRadius: BorderRadius.all(Radius.circular(15.0))
                 ),),
               ),
               GestureDetector(
                 onTap: (){
                   setState(() {
                     seletedcolor=co[5];
                   });
                   game();
                 },
                 child: Container(
                 width: 125,
                 height: 125,
                 decoration: BoxDecoration(
                   color: co[5],
                   borderRadius: BorderRadius.all(Radius.circular(15.0))
                 ),),
               ),
             ],
           ),  
          ],
        ),
    );
  }
}
