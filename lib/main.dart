import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonScreen(),
    );
  }
}

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              buttonPressed = !buttonPressed;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
              boxShadow: buttonPressed
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        offset: const Offset(10, 10),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-1, -1),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
              border: buttonPressed
                  ? Border.all(width: 1, color: Colors.white)
                  : null,
            ),
            child: Icon(
              Icons.lightbulb,
              size: 70,
              color: buttonPressed
                  ? Colors.greenAccent.shade200
                  : Colors.grey.shade700,
            ),
          ),
        ),
      ),
    );
  }
}
