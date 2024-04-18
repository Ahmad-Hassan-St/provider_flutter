import 'package:flutter/material.dart';

class ChangeNotifyListener extends StatelessWidget {
  ChangeNotifyListener({super.key});

  ValueNotifier<int> _counter = new ValueNotifier<int>(1);
  ValueNotifier<bool> obscureText = new ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: obscureText,
              builder: (context, value, child) {
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Counter',
                    hintText: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        obscureText.value=!value;
                        print("text");
                      },
                      child: Icon(value? Icons.lock: Icons.block),
                    ),
                  ),
                  obscureText: obscureText.value,
                );
              }),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                print("child");
                return Text(
                  "Change ${value}",
                  style: TextStyle(fontSize: 50),
                );
              }),
        ],
      ),
    );
  }
}
