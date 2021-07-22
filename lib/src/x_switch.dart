import 'package:flutter/material.dart';

import 'x_text.dart';

class XSwitch extends StatefulWidget {
  final bool initValue;
  final String? title;
  final Function(bool)? onChanged;
  const XSwitch(
      {Key? key,
      this.initValue = false,
      @required this.onChanged,
      @required this.title})
      : super(key: key);

  @override
  _XSwitchState createState() => _XSwitchState();
}

class _XSwitchState extends State<XSwitch> {
  bool value = false;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XText(
              widget.title!,
              textType: TextType.headLine6,
              color: Colors.white,
            ),
            Switch(
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.white,
            ),
          ],
        ));
  }
}
