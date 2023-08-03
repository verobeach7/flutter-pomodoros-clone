import 'package:flutter/material.dart';

typedef Int2VoidFunc = void Function(int time, String num);

class TimeBox extends StatefulWidget {
  final String time;
  final Int2VoidFunc onResetPressed;
  final bool isBreaktime;
  final String selectedBoxNum;

  const TimeBox({
    super.key,
    required this.time,
    required this.onResetPressed,
    required this.isBreaktime,
    required this.selectedBoxNum,
  });

  @override
  State<TimeBox> createState() => _TimeBoxState();
}

class _TimeBoxState extends State<TimeBox> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: widget.time == widget.selectedBoxNum
            ? Colors.white
            : Colors.transparent,
        side: BorderSide(color: Theme.of(context).cardColor, width: 2),
      ),
      onPressed: widget.isBreaktime
          ? null
          : () {
              widget.onResetPressed(int.parse(widget.time) * 60, widget.time);
            },
      child: Text(
        widget.time,
        style: TextStyle(
          color: widget.time == widget.selectedBoxNum
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).cardColor.withOpacity(0.8),
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
