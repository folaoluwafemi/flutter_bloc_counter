import 'package:bloc_counter/bloc_layer/counter_bloc.dart';
import 'package:bloc_counter/model_layer/model.dart';
import 'package:bloc_counter/presentation_layer/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CounterScreen.id,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == CounterScreen.id) {
          return MaterialPageRoute(
              builder: (context) => BlocProvider<CounterBloc>(
                  create: (BuildContext context) => CounterBloc(
                        CounterState(
                          value: 0,
                        ),
                      ),
                  child: const CounterScreen()));
        }
         else {
          return MaterialPageRoute(
            builder: (context) => const SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text('You navigated to the wrong route'),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
