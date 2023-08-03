import 'package:flutter/material.dart';

class TimeBox extends StatelessWidget {
  final String time;
  const TimeBox({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).cardColor.withOpacity(0.8),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        time,
        style: TextStyle(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
