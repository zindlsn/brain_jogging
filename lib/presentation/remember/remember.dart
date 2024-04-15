import 'package:brain_jogging/domain/word/bloc/word_bloc.dart';
import 'package:brain_jogging/presentation/repeat/repeat.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberPage extends StatelessWidget {
  RememberPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WordBloc>(context).add(InitializeWords());
    BlocProvider.of<WordBloc>(context).add(LoadWords());
    return Scaffold(
        body: Column(
      children: [
        CircularCountDownTimer(
            width: 30,
            height: 30,
            duration: 3,
            isReverse: true,
            onComplete: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RepeatPage(),
                  ),
                ),
            fillColor: Colors.yellowAccent,
            ringColor: Colors.yellow),
        BlocBuilder<WordBloc, WordState>(builder: (context, state) {
          if (state is WordsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                      'Remember the following words and repeat it afterwards'),
                ),
                const Text('Berufe'),
                Row(
                  children: state.berufe.map((e) => Text(e)).toList(),
                ),
                const Text('Obst'),
                Row(children: state.obst.map((e) => Text(e)).toList()),
                const Text('Städte'),
                Row(children: state.cities.map((e) => Text(e)).toList()),
                const Text('Essen'),
                Row(children: state.essen.map((e) => Text(e)).toList()),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ],
    ));
  }
}
