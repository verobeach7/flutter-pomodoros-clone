import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoros_clone/screens/goal_widget.dart';
import 'package:pomodoros_clone/screens/round_widget.dart';
import 'package:pomodoros_clone/widgets/time_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const initTime = 1500;
  int totalSeconds = initTime;
  int setTime = initTime;
  bool isRunning = false;
  bool isBreaktime = false;
  int totalPomodoros = 0;
  int totalGoal = 0;
  String selectedBoxNum = '25';
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(
        () {
          if (!isBreaktime) totalPomodoros = totalPomodoros + 1;
          isBreaktime = !isBreaktime;
          isRunning = false;
          if (totalPomodoros == 4) {
            totalPomodoros = 0;
            totalGoal = totalGoal + 1;
          }
          isBreaktime ? totalSeconds = 300 : totalSeconds = setTime;
        },
      );
      timer.cancel();
    } else {
      setState(
        () {
          totalSeconds = totalSeconds - 200;
          if (totalSeconds < 0) totalSeconds = 0;
        },
      );
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed(int time, String num) {
    if (isRunning) timer.cancel();
    setState(() {
      totalPomodoros = 0;
      totalSeconds = time;
      setTime = time;
      isRunning = false;
      selectedBoxNum = num;
    });
  }

  String minutesFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return (duration.inMinutes).toString().padLeft(2, '0');
  }

  String secondsFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'POMOTIMER',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 180,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          minutesFormat(totalSeconds),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 80,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                          width: 50,
                          height: 130,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Text(
                              ':',
                              style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          )),
                      Container(
                        width: 140,
                        height: 180,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          secondsFormat(totalSeconds),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 80,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return RadialGradient(
                              center: Alignment.center,
                              radius: 4.0,
                              colors: [
                                Colors.white.withOpacity(1),
                                Colors.white.withOpacity(0.2)
                              ],
                              tileMode: TileMode.clamp,
                            ).createShader(bounds);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TimeBox(
                                time: '15',
                                onResetPressed: onResetPressed,
                                isBreaktime: isBreaktime,
                                selectedBoxNum: selectedBoxNum,
                              ),
                              TimeBox(
                                time: '20',
                                onResetPressed: onResetPressed,
                                isBreaktime: isBreaktime,
                                selectedBoxNum: selectedBoxNum,
                              ),
                              TimeBox(
                                time: '25',
                                onResetPressed: onResetPressed,
                                isBreaktime: isBreaktime,
                                selectedBoxNum: selectedBoxNum,
                              ),
                              TimeBox(
                                time: '30',
                                onResetPressed: onResetPressed,
                                isBreaktime: isBreaktime,
                                selectedBoxNum: selectedBoxNum,
                              ),
                              TimeBox(
                                time: '35',
                                onResetPressed: onResetPressed,
                                isBreaktime: isBreaktime,
                                selectedBoxNum: selectedBoxNum,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black.withOpacity(0.3),
                            child: isBreaktime
                                ? TextButton(
                                    onPressed: onStartPressed,
                                    child: Text(
                                      'Let\'s break!',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : IconButton(
                                    iconSize: 80,
                                    color: Theme.of(context).cardColor,
                                    onPressed: isRunning
                                        ? onPausePressed
                                        : onStartPressed,
                                    icon: Icon(isRunning
                                        ? Icons.pause_outlined
                                        : Icons.play_arrow_rounded),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundWidget(
                              totalPomodoros: totalPomodoros,
                            ),
                            GoalWidget(
                              totalGoal: totalGoal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
