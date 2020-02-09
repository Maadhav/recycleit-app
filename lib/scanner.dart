import 'dart:io';
import 'package:homepage/user.dart';

import 'appointment.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'smart_scanner.dart';
import 'map.dart';
import 'package:tflite/tflite.dart';

class Scanner extends StatefulWidget {
   Scanner.tp();
   Scanner({Key key, this.image}) : super(key: key);
   File image;

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
   String bio;
    File _image;
  List _recognitions;
  String message = "";
  int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
static  List<Widget> _widgetOptions = <Widget>[
  Scanner.tp(),
  Map(),
  Appointment(),
  HomeScreen(),
  
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}



Future predictImage(File image) async {
    if (image == null) return;
        await recognizeImage(image);
      // await recognizeImageBinary(image);


    setState(() {
      _image = image;
    });
 }
@override
  void initState() {
    super.initState();

    loadModel().then((val) {
      setState(() {
      });
      predictImage(widget.image);
    });
  }


  Future loadModel() async {
    Tflite.close();
      String res;
      res =  await Tflite.loadModel(
  model: "assets/model_unquant.tflite",
  labels: "assets/labels.txt",
  numThreads: 1 // defaults to 1
);
      print(res);
    
  }

  Future recognizeImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      message = "a";
      print(recognitions[0]["label"]);
      switch (recognitions[0]["label"]) {
        case "Plastic Wrapper":
          bio = "No";
          break;
        case "Plastic Bottle":
          bio = "No";
          break;
        case "Paper":
          bio = "Yes";
          break;
        case "E Waste":
          bio = "No";
          break;
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3fbe3),
      appBar: AppBar(
        title: Center(child: Text("RECYCLE IT",style: TextStyle(color: Colors.lightGreen,fontFamily:'Bree Serif',fontSize: 30,wordSpacing: 10 ),)),
        backgroundColor: Color(0xFF101820),
      ),
      body:_selectedIndex==0? Stack(
        alignment: Alignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            Positioned(
      top: 25,

            child: SizedBox(
      height:250,
      width:250,
      child: widget.image==null?FlareActor(
        "assets/Scanning.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "Untitled",
      ):ClipRRect(
        child: Image.file(widget.image,
        ),
        borderRadius: BorderRadius.circular(20),
      )
            ),),
            Positioned(
              top: 290,
              child: _recognitions!=null ?Column(
                children: <Widget>[
                  Text("Type: " +_recognitions[0]["label"],style: TextStyle(fontSize: 18),),
                  Text("Biodegradable: " + bio,style: TextStyle(fontSize: 18),),
                  Text("Recyclable: " + "Yes",style: TextStyle(fontSize: 18),),
                ],
              ):Text(""),
            ),
            Positioned(
              top: 370,
              child: _recognitions!=null ?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:  CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),),
                    onPressed: (){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Map()
                       ),
                      );
                    },
                    child: Text("Find Station",style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                  ),
                  SizedBox(width: 20,),
                  MaterialButton(
                    padding: EdgeInsets.all(15),
                    onPressed: (){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Appointment()
                       ),
                      );
                    },
                    child: Text("Pick Up Appointment",style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ],
              ):Text("")
            ),
            Positioned(
            // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,),
            top: MediaQuery.of(context).size.height*0.56,
      child: SmartFlareAnimation()),
            
          ],
        ): Center(child:_widgetOptions[_selectedIndex],),
      bottomNavigationBar: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xFF101820),
        primaryColor: Colors.red,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
    child: BottomNavigationBar(
      elevation: 100,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size:30),
          title: Text('Home'),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map,size:30),
          title: Text('Map'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone,size:30),
          title: Text('Phone'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle,size:30),
          title: Text('Users'),
          
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.lightGreen,
      onTap: _onItemTapped,
      
      ),
      ),
    );
  }
}
