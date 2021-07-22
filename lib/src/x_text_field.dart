import 'package:flutter/material.dart';
import 'x_text.dart';

enum InputFieldType { regular, phone, email, number, password, url }

class XTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final String? label;
  final int maxLines;
  final Color fillColor;
  final Color hintColor;
  final Color? textColor;
  final Widget? suffixIcon;
  final Color borderColor;
  final TextType textType;
  final EdgeInsets padding;
  final bool enabled;
  final InputFieldType inputType;
  // ignore: use_key_in_widget_constructors
  const XTextField(
      {Key? key,
      @required this.controller,
      this.hint = '',
      this.label,
      this.inputType = InputFieldType.regular,
      this.hintColor = Colors.grey,
      this.textColor,
      this.fillColor = Colors.white,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      this.maxLines = 1,
      this.borderColor = Colors.transparent,
      this.textType = TextType.body1,
      this.enabled = true,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hint.isNotEmpty)
            XText(
              label ?? hint,
              color: Colors.white,
              textType: textType,
              fontWeight: FontWeight.w300,
              padding: const EdgeInsets.only(bottom: 5),
            ),
          TextFormField(
            enabled: enabled,
            enableInteractiveSelection: inputType != InputFieldType.password,
            validator: _validator,
            showCursor: true,
            maxLines: maxLines,
            cursorColor: Theme.of(context).colorScheme.primaryVariant,
            keyboardType: _toTextInputType(),
            obscureText: inputType == InputFieldType.password,
            style: (textType).toStyle(context).copyWith(
                  color: textColor ?? Colors.blue[900],
                  fontWeight: FontWeight.w300,
                ),
            controller: controller,
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              isDense: true,
              prefixStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 25),
              hintText: hint,
              errorMaxLines: 2,
              suffixIcon: suffixIcon,
              labelStyle:
                  TextType.body2.toStyle(context).copyWith(color: hintColor),
              hintStyle: textType
                  .toStyle(context)
                  .copyWith(color: hintColor, fontWeight: FontWeight.w300),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                // borderSide: BorderSide(color: Colorsansparent),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextInputType _toTextInputType() {
    switch (inputType) {
      case InputFieldType.phone:
        return TextInputType.phone;
      case InputFieldType.email:
        return TextInputType.emailAddress;
      case InputFieldType.number:
        return TextInputType.number;
      case InputFieldType.password:
        return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }

  String? _validator(String? text) {
    if (text == null || text.isEmpty) {
      return "empty_field";
    } else {
      switch (inputType) {
        case InputFieldType.regular:
          return null;
        case InputFieldType.phone:
          final RegExp regExp =
              RegExp(r"((\+)|(00))?[0-9\(][\s\-\)0-9][^\n]{6,15}[0-9]");
          return !regExp.hasMatch(text) ? 'phone_valid' : null;
        case InputFieldType.email:
          final RegExp regExp = RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
          return !regExp.hasMatch(text) ? 'err_email' : null;
        case InputFieldType.number:
          return double.tryParse(text) == null
              ? "Only numbers are allowed"
              : null;
        case InputFieldType.password:
          final RegExp regExp =
              RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$");
          return !regExp.hasMatch(text) ? 'err_password_format' : null;
        case InputFieldType.url:
          final RegExp regExp = RegExp(
              r"\b(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/\S*)?\b\/?");
          return !regExp.hasMatch(text) ? 'phone_valid' : null;
      }
    }
  }
}
