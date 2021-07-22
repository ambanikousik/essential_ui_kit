import 'package:flutter/material.dart';

enum TextType {
  headLine1,
  headLine2,
  headLine3,
  headLine4,
  headLine5,
  headLine6,
  subtitle1,
  subtitle2,
  body1,
  body2,
}

extension TypeToStyle on TextType {
  TextStyle toStyle(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle _style;
    switch (this) {
      case TextType.headLine1:
        _style = textTheme.headline1!;
        break;
      case TextType.headLine2:
        _style = textTheme.headline2!;
        break;
      case TextType.headLine3:
        _style = textTheme.headline3!;
        break;
      case TextType.headLine4:
        _style = textTheme.headline4!;
        break;
      case TextType.headLine5:
        _style = textTheme.headline5!;
        break;
      case TextType.headLine6:
        _style = textTheme.headline6!;
        break;
      case TextType.body1:
        _style = textTheme.bodyText1!;
        break;
      case TextType.body2:
        _style = textTheme.bodyText2!;
        break;
      case TextType.subtitle1:
        _style = textTheme.subtitle1!;
        break;
      case TextType.subtitle2:
        _style = textTheme.subtitle2!;
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
