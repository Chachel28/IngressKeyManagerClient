import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerticalText extends StatefulWidget {
  String text;
  VerticalText({this.text});

  @override
  _VerticalTextState createState() => _VerticalTextState();
}

class _VerticalTextState extends State<VerticalText> {
  @override
  Widget build(BuildContext context) {
    widget.text = 'hola, he cambiado cosas';
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            '${widget.text}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
