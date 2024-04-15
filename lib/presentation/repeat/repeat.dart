import 'package:brain_jogging/infrastructure/word_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RepeatPage extends StatefulWidget {
  RepeatPage({super.key});

  @override
  State<RepeatPage> createState() => _RepeatPageState();
}

class _RepeatPageState extends State<RepeatPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _berufOne = TextEditingController();

  bool? correctOne;

  Paint black = Paint()..color = Colors.black;

  Paint red = Paint()..color = Colors.red;

  Paint green = Paint()..color = Colors.green;

  WordRepository wordRepository = GetIt.instance.get<WordRepository>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Repeat'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Berufe'),
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    SizedBox(width: 100, child: TextFormField()),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: 100,
                        child: TextFormField(
                          enabled: correctOne == null,
                          readOnly: correctOne != null,
                          controller: _berufOne,
                          decoration: InputDecoration(
                              border:
                                  correctOne != null ? InputBorder.none : null),
                          style: TextStyle(
                              foreground: correctOne == null
                                  ? black
                                  : correctOne == false
                                      ? red
                                      : green),
                          validator: (value) {
                            if (value?.toLowerCase() ==
                                wordRepository.berufeToRemember[1]
                                    .toLowerCase()) {
                              correctOne = true;
                            } else {
                              correctOne = false;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(width: 100, child: TextFormField()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(width: 100, child: TextFormField()),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    _formKey.currentState?.validate();
                    _berufOne.text = wordRepository.berufeToRemember[1];
                    setState(() {});
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => ResultPage()));
                  },
                  child: Text('Check'))
            ],
          ),
        ),
      ),
    );
  }
}

class WordRepeat extends StatefulWidget {
  WordRepeat({Key? key}) : super(key: key);

  @override
  _WordRepeatState createState() => _WordRepeatState();
}

class _WordRepeatState extends State<WordRepeat> {
  String solution = 'Essen';
  bool? _isCorrectGuess;
  WordRepository wordRepository = GetIt.instance.get<WordRepository>();
  final TextEditingController _berufOne = TextEditingController();

  Paint black = Paint()..color = Colors.black;

  Paint red = Paint()..color = Colors.red;

  Paint green = Paint()..color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextFormField(
        enabled: _isCorrectGuess == null,
        readOnly: _isCorrectGuess != null,
        controller: _berufOne,
        decoration: InputDecoration(
            border: _isCorrectGuess != null ? InputBorder.none : null),
        style: TextStyle(
            foreground: _isCorrectGuess == null
                ? black
                : _isCorrectGuess == false
                    ? red
                    : green),
        validator: (value) {
          if (value?.toLowerCase() ==
              wordRepository.berufeToRemember[1].toLowerCase()) {
            _isCorrectGuess = true;
          } else {
            _isCorrectGuess = false;
          }
          return null;
        },
      ),
    );
  }
}
