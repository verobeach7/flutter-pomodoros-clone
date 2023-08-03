import 'package:flutter/material.dart';

class GoalWidget extends StatefulWidget {
  final int totalGoal;
  const GoalWidget({super.key, required this.totalGoal});

  @override
  State<GoalWidget> createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${widget.totalGoal}/12',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).cardColor.withOpacity(0.7),
          ),
        ),
        Text(
          'GOAL',
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
