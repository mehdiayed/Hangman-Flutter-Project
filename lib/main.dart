import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman_projet_dsi31/UI/colors.dart';
import 'package:hangman_projet_dsi31/utils/game.dart';
import 'package:hangman_projet_dsi31/widget/Words.dart';
import 'package:hangman_projet_dsi31/widget/figure_image.dart';
import 'package:hangman_projet_dsi31/widget/letter.dart';
import 'package:hangman_projet_dsi31/widget/loss.dart';
import 'package:hangman_projet_dsi31/widget/victory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
// ------------- choosing the game word --------------
  // List _items = [];

// Fetch content from the json file
  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('words/words_english.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _items = data["word"];
  //   });
  // }

 
  // int nbr =Random().nextInt(5) + 1;
  String word = Game.ListOfWords[1].toUpperCase();

     

  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    " ",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    " "
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text(
          "Mes Lettres",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.white),
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

                figureImage(Game.tries >= 0, "assets/hang.png"),
                figureImage(Game.tries >= 1, "assets/head.png"),
                figureImage(Game.tries >= 2, "assets/body.png"),
                figureImage(Game.tries >= 3, "assets/ra.png"),
                figureImage(Game.tries >= 4, "assets/la.png"),
                figureImage(Game.tries >= 5, "assets/rl.png"),
                figureImage(Game.tries >= 6, "assets/ll.png"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          // ------------ now we will build the hidden word widget

          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                print(word);
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);

                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tries++;
                            } else {
                              Game.selectedChartrue.add(e);
                            }
                          });
                          if (Game.tries == 6) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => losspage()));
                            print("c bon a9if");
                          } else if (Game.selectedChartrue.length ==
                              word.length) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => victory()));
                            print("hak rba7t");
                          }
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      // after you press the button
                      ? Colors.deepPurple[300]

                      // button unpressed
                      : Colors.blueGrey,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
   
}
