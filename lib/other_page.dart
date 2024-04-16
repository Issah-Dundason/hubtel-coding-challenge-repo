import 'package:flutter/material.dart';

// This widget is a placeholder for any page that is yet to implemented
class OtherPage extends StatelessWidget {
  const OtherPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
