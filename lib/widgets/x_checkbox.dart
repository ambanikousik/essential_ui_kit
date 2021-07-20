import 'package:flutter/material.dart';
import 'x_text.dart';

class XCheckBox extends StatefulWidget {
  final bool? initValue;
  final String? title;
  final Function(bool)? onChanged;
  const XCheckBox(
      {Key? key,
      @required this.initValue,
      @required this.onChanged,
      @required this.title})
      : super(key: key);

  @override
  _XCheckBoxState createState() => _XCheckBoxState();
}

class _XCheckBoxState extends State<XCheckBox> {
  bool? value;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              XText(
                widget.title ?? "",
                textType: TextType.headLine6,
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
                height: Checkbox.width,
                width: Checkbox.width,
                child: Checkbox(
                  value: value,
                  checkColor: Colors.green[400],
                  activeColor: Colors.transparent,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                    widget.onChanged!(value!);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
