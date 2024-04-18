import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_provider/provider/count_provider.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      countProvider.increment();
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Timer",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Consumer<CountProvider>(builder: (context, value, child) {
            print("only build text provider");
            return Text(
              countProvider.count.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ],
      ),
    );
  }
}
