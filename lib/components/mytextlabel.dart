import 'package:flutter/material.dart';

class Mytextlabel extends StatelessWidget {
  const Mytextlabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(label, style: TextStyle(color: Colors.black)),
    );
  }
}
