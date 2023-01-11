import 'package:flutter/material.dart';
import '../UI/colors.dart';
import '../main.dart';
import '../utils/game.dart';
import 'figure_image.dart';

class victory extends StatelessWidget {
  const victory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          title: Text(
            "Mes Lettres",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.white),
          ),
          // little shadow in down of the bar -------------
          elevation: 0,
          centerTitle: true,

          backgroundColor: AppColor.primaryColor,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    // ---------------- figureimage widget ----------------
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      "YOU JUST WON !!!! ",
                      style: TextStyle(
                        color: AppColor.primaryColorDark,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                ],
              ),
              TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          AppColor.primaryColorDark),
                    ),
                    onPressed: () {
                      Game.tries = 0;
                      Game.selectedChar.clear();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeApp()));
                    },
                    child: Text(
                      "Play again",
                      style: TextStyle(
                        backgroundColor: AppColor.primaryColorDark,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 29.0,
                      ),
                    ),
                  )
            ]));
  }
}
