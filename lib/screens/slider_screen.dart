import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/silder_provider.dart';

class SliderColor extends StatefulWidget {
  const SliderColor({super.key});

  @override
  State<SliderColor> createState() => _SliderColorState();
}

class _SliderColorState extends State<SliderColor> {
  @override
  Widget build(BuildContext context) {
    print("SliderColor");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Color'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ColorProvider>(builder: (context, value, child) {
              return Slider(
                value: value.value,
                min: 0.0,
                max: 1.0,
                activeColor: Colors.red,
                inactiveColor: Colors.blue,
                onChanged: (val) {
                  value.value = val;
                },
              );
            }),
            Consumer<ColorProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.yellow.withOpacity(value.value),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
