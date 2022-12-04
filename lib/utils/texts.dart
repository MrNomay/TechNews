// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modifiedtext extends StatelessWidget {
  const modifiedtext({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size,
      ),
    );
  }
}

//Boldtext
class boldtext extends StatelessWidget {
  const boldtext({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
