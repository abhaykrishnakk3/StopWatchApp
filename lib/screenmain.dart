import 'dart:async';

import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started = false;
  List laps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(children: [
          const Center(
            child: Text(
              'StopWatch App',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Center(
            child: Text(
              '$digitHours:$digitMinutes:$digitSeconds',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
                color: const Color(0xFF323F68),
                borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lap ${index + 1}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            '${laps[index]}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          )
                        ]),
                  );
                }),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RawMaterialButton(
                  onPressed: () {
                    (!started) ? start() : stop();
                  },
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text(
                    (!started) ? "Start" : "Pause",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              IconButton(
                  onPressed: () {
                    addlaps();
                  },
                  icon: const Icon(
                    Icons.flag,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: RawMaterialButton(
                  fillColor: Colors.blue,
                  onPressed: () {
                    reset();
                  },
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ]),
      )),
    );
  }

//creating the stop timer function

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //creating the reset function
  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';

      started = false;
    });
  }

  void addlaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }
  // creating the start function

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinuts = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinuts > 59) {
          localHours++;
          localMinuts = 0;
        }
        {
          localMinuts++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinuts;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }
}
