import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'x_text.dart';

class XButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets margin;
  final Color textColor;
  final double width;
  final TextType textType;
  final EdgeInsets? padding;
  final double borderRadius;
  final double elevation;
  final Widget? customWidget;
  final bool showRightArrow;
  final bool hasBorder;
  const XButton(
      {Key? key,
      @required this.text,
      @required this.onPressed,
      this.color,
      this.borderColor,
      this.width = double.infinity,
      this.textColor = Colors.black,
      this.margin = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      this.borderRadius = 10,
      this.textType = TextType.headLine5,
      this.padding,
      this.showRightArrow = false,
      this.customWidget,
      this.elevation = 1,
      this.hasBorder = false})
      : super(key: key);

  factory XButton.customWidget(
      {@required Widget? child, @required VoidCallback? onPressed}) {
    return XButton(
      text: '',
      onPressed: onPressed,
      color: Colors.lightGreen[400],
      customWidget: child,
      margin: EdgeInsets.zero,
    );
  }

  factory XButton.outLined(
      {@required Color? color,
      @required String? text,
      @required VoidCallback? onTap,
      double borderRadius = 10}) {
    return XButton(
      text: text,
      onPressed: onTap,
      hasBorder: true,
      borderColor: color,
      textColor: color!,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding ?? const EdgeInsets.all(15),
          elevation: elevation,
          primary: color ?? Colors.white,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(
              width: 0,
              color: borderColor ?? Theme.of(context).colorScheme.primary,
              style: hasBorder ? BorderStyle.solid : BorderStyle.none),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: showRightArrow
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (customWidget != null)
              customWidget!
            else
              XText(text!,
                  color: textColor,
                  maxLine: 1,
                  // fontWeight: FontWeight.w600,
                  textType: textType),
            if (showRightArrow)
              Icon(
                Icons.chevron_right_outlined,
                color: textColor,
                size: 30,
              )
          ],
        ),
      ),
    );
  }
}
