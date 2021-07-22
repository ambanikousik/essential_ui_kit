import 'package:flutter/material.dart';

import 'x_button.dart';
import 'x_text.dart';

class XDialogue extends StatelessWidget {
  final String? title;
  final String? details;
  final bool isError;
  final String buttonText;
  final VoidCallback? onTap;
  const XDialogue(
      {Key? key,
      @required this.title,
      @required this.details,
      this.isError = false,
      this.buttonText = 'Close',
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      contentPadding: const EdgeInsets.only(top: 20),
      title: Container(
        color: Colors.green,
        child: XText(
          title ?? "Title",
          textType: TextType.headLine6,
          padding: const EdgeInsets.all(10),
          color: Colors.white,
        ),
      ),
      titlePadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 250, maxWidth: 400),
            child: XText(
              details ?? "details",
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          XButton(
              color: Theme.of(context).colorScheme.primary,
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
    );
  }
}
