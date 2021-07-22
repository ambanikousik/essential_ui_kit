import 'package:flutter/material.dart';

import '../essential_ui_kit.dart';

XText _optionText(String option) => XText(
      option,
    );

XText _labelText(String option) => XText(
      option,
      padding: const EdgeInsets.symmetric(vertical: 5),
    );

class XDropdown<T> extends StatefulWidget {
  final List<T>? options;
  final String Function(T data)? displayName;
  final Function(T value)? onSelected;
  final String? hint;
  final TextEditingController? controller;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final XText Function(String option) optionsText;
  final XText Function(String option) labelText;

  const XDropdown(
      {Key? key,
      @required this.options,
      @required this.controller,
      @required this.hint,
      @required this.displayName,
      this.margin = const EdgeInsets.symmetric(horizontal: 20),
      @required this.onSelected,
      this.optionsText = _optionText,
      this.labelText = _labelText,
      this.padding = const EdgeInsets.symmetric(horizontal: 10)})
      : super(key: key);

  @override
  _XDropdownState<T> createState() => _XDropdownState<T>();
}

class _XDropdownState<T> extends State<XDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText(
            widget.hint ?? 'Select from dropdown:',
          ),
          Container(
            padding: widget.padding,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonFormField<T>(
              hint: widget.optionsText(
                widget.controller!.text.isEmpty
                    ? 'Select'
                    : widget.controller!.text,
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
                  child: widget.optionsText(widget.displayName!(value)),
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
