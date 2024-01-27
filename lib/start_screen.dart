import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.startquiz, {super.key});
  final void Function() startquiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300.0, color: const Color.fromARGB(198, 19, 153, 241)),
          const SizedBox(height: 40),
          const Text(
            "Welcome to the Flutter framework Quiz!!",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(178, 204, 18, 64)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30.0),
          OutlinedButton.icon(
            onPressed: startquiz,
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
