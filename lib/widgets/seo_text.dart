import 'package:flutter/material.dart';

enum TextRendererStyle { header1, header2, header3, header4, paragraph }

class SEOText extends StatelessWidget {
  const SEOText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.textRendererStyle,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
