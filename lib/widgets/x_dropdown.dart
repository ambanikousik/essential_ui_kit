import 'package:essential_ui_kit/widgets/x_text.dart';
import 'package:flutter/material.dart';

class XDropdown<T> extends StatefulWidget {
  final List<T>? options;
  final String Function(T data)? displayName;
  final Function(T value)? onSelected;
  final String? hint;
  final TextEditingController? controller;
  final EdgeInsets? margin;
  const XDropdown(
      {Key? key,
      @required this.options,
      @required this.controller,
      @required this.hint,
      @required this.displayName,
      this.margin,
      @required this.onSelected})
      : super(key: key);

  @override
  _XDropdownState<T> createState() => _XDropdownState<T>();
}

class _XDropdownState<T> extends State<XDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XText(
            widget.hint ?? 'Select from dropdown:',
            color: Colors.white,
            textType: TextType.headLine6,
            fontWeight: FontWeight.w300,
            padding: const EdgeInsets.only(bottom: 5),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonFormField<T>(
              hint: XText(
                widget.controller!.text.isEmpty
                    ? 'Select'
                    : widget.controller!.text,
                textType: TextType.headLine6,
                color: Colors.blue[900],
              ),
              style: Theme.of(context).primaryTextTheme.caption,
              validator: (data) =>
                  data == null ? "Please select from dropdown" : null,
              // underline: const SizedBox.shrink(),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.blue[900],
              ),
              items: widget.options!.map((T value) {
                return DropdownMenuItem(
                  value: value,
                  child: Row(
                    children: <Widget>[
                      XText(
                        widget.displayName!(value),
                        textType: TextType.headLine5,
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.controller!.text = widget.displayName!(value!);
                  widget.onSelected!(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
