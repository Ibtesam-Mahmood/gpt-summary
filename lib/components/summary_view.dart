
import 'package:flutter/material.dart';

class SummaryView extends StatefulWidget {

  final String text;

  const SummaryView({super.key, required this.text});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}