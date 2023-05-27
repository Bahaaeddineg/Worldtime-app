import 'package:flutter/material.dart';
 Text customText(String text, bool align,double size, String family, Color color,
      FontWeight fw, double ls) {
    return Text(
      text,
      textAlign: align ? TextAlign.center:null,
      style: TextStyle(
          letterSpacing: ls,
          fontSize: size,
          fontFamily: family,
          fontWeight: fw,
          color: color),
    );
  }