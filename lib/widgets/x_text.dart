import 'package:flutter/material.dart';

enum TextType {
  headLine1,
  headLine2,
  headLine3,
  headLine4,
  headLine5,
  headLine6,
  body1,
  body2,
  body3,
}

extension TypeToStyle on TextType {
  TextStyle toStyle(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle _style;
    switch (this) {
      case TextType.headLine1:
        _style = textTheme.headline1!.copyWith(fontSize: 96);
        break;
      case TextType.headLine2:
        _style = textTheme.headline2!.copyWith(fontSize: 60);
        break;
      case TextType.headLine3:
        _style = textTheme.headline3!.copyWith(fontSize: 48);
        break;
      case TextType.headLine4:
        _style = textTheme.headline4!.copyWith(fontSize: 34);
        break;
      case TextType.headLine5:
        _style = textTheme.headline5!.copyWith(fontSize: 24);
        break;
      case TextType.headLine6:
        _style = textTheme.headline6!.copyWith(fontSize: 20);
        break;
      case TextType.body1:
        _style = textTheme.bodyText1!.copyWith(fontSize: 16);
        break;
      case TextType.body2:
        _style = textTheme.bodyText2!.copyWith(fontSize: 14);
        break;
      case TextType.body3:
        _style = textTheme.bodyText2!..copyWith(fontSize: 10);
        break;
    }
    return _style;
  }
}

class XText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final Color? color;
  final double? fontSize;
  final TextAlign? align;
  final TextType? textType;
  final EdgeInsets? padding;
  final FontWeight? fontWeight;
  final bool? isItalic;
  const XText(
    this.text, {
    Key? key,
    this.color,
    this.textType = TextType.body1,
    this.padding = EdgeInsets.zero,
    this.maxLine = 3,
    this.fontWeight = FontWeight.normal,
    this.fontSize,
    this.align,
    this.isItalic = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Text(
        text,
        textAlign: align,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        style: textType!.toStyle(context).copyWith(
              color: color,
              fontStyle: isItalic! ? FontStyle.italic : FontStyle.normal,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
      ),
    );
  }
}
