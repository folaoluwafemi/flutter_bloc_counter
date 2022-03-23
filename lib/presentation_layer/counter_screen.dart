import 'package:bloc_counter/bloc_layer/counter_bloc.dart';
import 'package:bloc_counter/bloc_layer/counter_event.dart';
import 'package:bloc_counter/model_layer/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  static const id = '/counterScreen';

  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Counter'),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.value.toString(),
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(OnCounterIncrementPressed());
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(OnCounterDecrementPressed());
              },
              child: const Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
