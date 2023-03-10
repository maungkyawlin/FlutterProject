// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  SmallText({
    Key? key,
    this.color = const Color(0xFF8f837f),
    required this.text,
    this.size = 14,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: overflow,
        style: TextStyle(
            color: color,
            fontFamily: 'Roboto',
            fontSize: size,
            fontWeight: FontWeight.w100));
  }
}
