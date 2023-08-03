import 'package:flutter/material.dart';

class RoundWidget extends StatefulWidget {
  final int totalPomodoros;
  const RoundWidget({super.key, required this.totalPomodoros});

  @override
  State<RoundWidget> createState() => _RoundWidgetState();
}

class _RoundWidgetState extends State<RoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${widget.totalPomodoros}/4',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).cardColor.withOpacity(0.7),
          ),
        ),
        Text(
          'ROUND',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).cardColor,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
