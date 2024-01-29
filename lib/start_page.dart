import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  final Function(String) onStart;
  const StartPage({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/question_bg.png',
                  width: 300,
                ),
              ),
              Text(
                'Let\'s Learn !',
                style: GoogleFonts.fjallaOne(color: Colors.white, fontSize: 50),
              ),
              Text(
                'test your grammar with fun quizzes',
                style: GoogleFonts.teko(color: Colors.white),
              ),
            ],
          ),
        ),
        // start button quiz_page
        Expanded(
            flex: 1,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Colors.deepPurple.shade200,
                    Colors.deepPurple.shade400
                  ]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.deepPurple.shade700,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset:const Offset(4, 4)),
                    BoxShadow(
                        color: Colors.deepPurple.shade200,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset:const Offset(-4, -4))
                  ]),
              child: IconButton(
                  onPressed: () => onStart('quiz_page'),
                  icon:const Icon(
                    Icons.arrow_forward_ios,
                    size: 50,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ))
      ],
    );
  }
}
