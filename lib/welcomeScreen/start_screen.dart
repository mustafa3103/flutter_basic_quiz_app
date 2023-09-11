import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assetts/images/quiz-logo.png',
              width: 250, color: const Color.fromARGB(37, 241, 236, 236)),
          const SizedBox(height: 30),
          Text(
            "Learn flutter the fun way",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 215, 214, 217),
            ),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 134, 95, 201)),
            ),
            label: const Text('Start Quiz'),
            onPressed: startQuiz,
          )
        ],
      ),
    );
  }
}
