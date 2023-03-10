// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpandText extends StatelessWidget {
  Color? color;
  final String text;
  TextAlign align;
  double size;
  double height;

  ExpandText({
    Key? key,
    this.color = const Color(0xFF8f837f),
    required this.text,
    this.align = TextAlign.justify,
    this.size = 14,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        style: TextStyle(
            height: height,
            color: color,
            fontFamily: 'Roboto',
            fontSize: size,
            fontWeight: FontWeight.w100));
  }
}
