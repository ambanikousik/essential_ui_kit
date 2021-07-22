import 'package:flutter/material.dart';

class XSnackBar {
  final BuildContext context;
  const XSnackBar(this.context);

  void loading() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
      children: const [
        CircularProgressIndicator(),
        SizedBox(
          width: 10,
        ),
        Text('Loading ...')
      ],
    )));
  }

  void message({@required String? message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message ?? "Message")));
  }

  void hide() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
