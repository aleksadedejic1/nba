import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  const MyListTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      titleTextStyle: GoogleFonts.montserrat(fontWeight: FontWeight.bold,letterSpacing: 1),
      subtitleTextStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500,letterSpacing: 1),
      
    );
  }
}