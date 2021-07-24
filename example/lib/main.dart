import 'package:essential_ui_kit/essential_ui_kit.dart';
import 'package:essential_ui_kit_example/kousik_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     MaterialApp(
     home:  MyAppX(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyAppX extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(children: [
          XButton(
            color: Colors.blue[800],
            textColor: Colors.white,
            text: "Kousik", onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const KousikPage()));
            })
        ],),
      );
  }
}
