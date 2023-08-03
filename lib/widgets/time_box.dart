import 'package:flutter/material.dart';

typedef Int2VoidFunc = void Function(int time);

class TimeBox extends StatefulWidget {
  final String time;
  final Int2VoidFunc onResetPressed;
  const TimeBox({
    super.key,
    required this.time,
    required this.onResetPressed,
  });

  @override
  State<TimeBox> createState() => _TimeBoxState();
}

class _TimeBoxState extends State<TimeBox> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        widget.onResetPressed(int.parse(widget.time) * 60);
      },
      // width: 70,
      // height: 50,
      // alignment: Alignment.center,
      // decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Theme.of(context).cardColor.withOpacity(0.8),
      //       width: 3,
      //     ),
      //     borderRadius: BorderRadius.circular(8)),
      child: Text(
        widget.time,
        style: TextStyle(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
