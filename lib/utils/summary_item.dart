import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.summaryData});

  final Map<String, Object> summaryData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
          padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 176, 142, 212),
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(4, 4)),
            ],
            color: Color.fromARGB(255, 183, 138, 211).withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: summaryData['user_answer'] ==
                                summaryData['right_answer']
                            ?Color.fromARGB(255, 54, 182, 165)
                            :const Color.fromARGB(255, 232, 79, 120)),
                    child: Text(
                      summaryData['quiz_id'].toString(),
                      style: GoogleFonts.novaSquare(
                          color:const Color.fromARGB(255, 217, 217, 217),
                          fontSize: 12),
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      summaryData['question'].toString(),
                      style:const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Text(summaryData['right_answer'].toString(),
                        style: const TextStyle(
                            color:  Color.fromARGB(255, 0, 255, 8))),
                    Text(summaryData['user_answer'].toString(),
                        style: TextStyle(
                            color: summaryData['user_answer'] ==
                                    summaryData['right_answer']
                                ?const Color.fromARGB(255, 0, 255, 8)
                                : Colors.red)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
