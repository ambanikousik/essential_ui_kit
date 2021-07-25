import 'dart:async';

import 'package:essential_ui_kit/essential_ui_kit.dart';
import 'package:essential_ui_kit_example/widgets/toast.dart';
import 'package:flutter/material.dart';

class HasibPage extends StatelessWidget {
  const HasibPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: const Text(
          'Hasib Test Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: XButton(
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  text: "Show Warning dialogue",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => XDialogue.warning(
                        "This is a warning message!",
                      ),
                    );
                  }),
            ),
            Center(
              child: XButton(
                  color: Colors.purple[400],
                  textColor: Colors.white,
                  text: "Show toast",
                  onPressed: () {
                    Toast.show(
                      "Something is Wrong with this toast. I don't know what but I will figure it out.",
                      context,
                      textColor: Colors.white,
                      backGroundColor: Colors.blue,
                    );
                    Timer(Duration(seconds: 3), () {
                      Toast.dismiss();
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
