import 'package:flutter/material.dart';

import 'x_button.dart';
import 'x_text.dart';

XText _title(String title)=> XText(
            title,
            textType: TextType.headLine6,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
          );

// Widget _body()=>           

class XDialogue extends StatelessWidget {
  final String? title;
  final String? details;
  final String buttonText;
  final XButton? button;
  final VoidCallback? onTap;
  final Color bgColor;
  final Color titleBarColor;
  final Widget? customBody;


  factory XDialogue.error(String error){
    return  XDialogue(
      title: "Error!",
      details: error,
      titleBarColor: Colors.redAccent,
      bgColor: Colors.white,
    );
  }

  final XText Function(String) titleXText;
  const XDialogue(
      {Key? key,
      @required this.title,
      @required this.details,
      this.buttonText = 'Close',
      this.onTap, 
      this.bgColor = const Color(0xffF3F2C9),
       this.titleXText = _title, 
       this.titleBarColor = const Color(0xff055052), this.customBody, this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: bgColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
          color:titleBarColor,
          child: titleXText(title??"title"),
        ),
     customBody??   _DialogueBody(   details ?? "details", titleBarColor),
         button??   XButton(
              width: 100,
                color: titleBarColor,
                textColor: Colors.white,
                textType: TextType.body1,
                padding: EdgeInsets.zero,
                text: buttonText,
                onPressed: onTap ??
                    () {
                      Navigator.pop(context);
                    })
          ],
        ),
      ),
    );
  }
}


class _DialogueBody extends StatelessWidget {
  final String details;
  final Color textColor;
  const _DialogueBody( this.details,this.textColor,{Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
              constraints: const BoxConstraints(minWidth: 250, maxWidth: 400),
              child: XText(
                details ,
                padding: const EdgeInsets.all(20),
                color: textColor,
              ),
            );
  }
}