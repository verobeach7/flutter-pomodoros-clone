import 'package:flutter/material.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '0/4',
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
