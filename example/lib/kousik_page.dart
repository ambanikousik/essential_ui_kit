import 'package:essential_ui_kit/essential_ui_kit.dart';
import 'package:flutter/material.dart';

class KousikPage extends StatelessWidget {
  const KousikPage({Key? key}) : super(key: key);


  final String _description = """The quick brown fox jumps over the lazy dog" is an English-language pangram—a sentence that contains all of the letters of the English alphabet. Owing to its brevity and coherence, it has become widely known.""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: const Color(0xff003638),
          title: const Text('Plugin example app'),
        ),
      backgroundColor: const Color(0xffF3F2C9),
      body: Center(child: XButton(
        color: const Color(0xff055052),
        textColor: Colors.white,
        text: "show dialogue", onPressed: (){
                    showDialog(context: context, builder: (context)=>  XDialogue.error("Some error occured",));

          // showDialog(context: context, builder: (context)=>  XDialogue(title: 'title', details: _description));
      }),),
    );
  }
}