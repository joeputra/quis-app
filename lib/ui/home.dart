import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';
import 'package:quiz_app/ui/color/hexColor.dart';

class QuizApp extends StatefulWidget {
  @override
  State<QuizApp> createState() => _nameState();
}

Color _purple = HexColor("#6908D6");
Color _black = HexColor("#1e2124");
Color _pink = HexColor("#FFB3EB");
Color _blue = HexColor("#7289da");
Color _gray = HexColor("#424549");
Color _grayAppBG = HexColor("#36393e");
Color _grayBG = HexColor("#282b30");

class _nameState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "Apakah Penjajahan bangsa Indonesia oleh Belanda terjadi kurang lebih selama? 350 tahun",
        true),
    Question.name(
        "Apakah Wage Rudolf Supratman Pencipta lagu Indonesia Raya ", true),
    Question.name(
        "Apakah Pembacaan teks proklamasi dilakukan di Jakarta ", false),
    Question.name("Apakah Fatmawati yang menjahit bendera merah putih ", true),
    Question.name(
        "Apa arti dari Bhineka Tunggal Ika? Berbeda-beda, tetapi tetap satu jua",
        true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("True Citizen"),
        centerTitle: true,
        // backgroundColor: _grayAppBG,
      ),
      // backgroundColor: _grayBG,
      body: Builder(builder: (context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 200,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      // style: const TextStyle(
                      //   fontSize: 16.0,
                      //   color: Colors.white,
                      // ),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    RaisedButton(
                    onPressed: () => _preQuestion(),
                    color: _blue,
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: _gray,
                    child: Text(
                      "Benar",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: _gray,
                    child: Text(
                      "Salah",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: _blue,
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                
                ],
              ),
              const Spacer(),
            ],
          ),
        );
      }),
    );
  }

_preQuestion(){
  setState(() {
     _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
  });
}

  _checkAnswer(bool useChoice, BuildContext context) {
    if (useChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //Jawaban Benar
      final snackbar = SnackBar(
          backgroundColor: _blue,
          duration: Duration(milliseconds: 500),
          content: Text("Jawaban Benar"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
      debugPrint("Jawaban Anda Benar");
      setState(() {
         _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
      });
    } else {
      debugPrint("Jawaban Salah");
      final snackbar = SnackBar(
          backgroundColor: _black,
          duration: Duration(milliseconds: 500),
          content: Text("Jawaban Anda Salah"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
}
