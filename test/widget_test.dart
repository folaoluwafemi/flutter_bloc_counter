// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_counter/bloc_layer/counter_bloc.dart';
import 'package:bloc_counter/bloc_layer/counter_event.dart';
import 'package:bloc_counter/model_layer/model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('bloc counter app test for incrementing and decrementing an integer',
      () {
    late CounterBloc counterBloc;
    setUp(() {
      counterBloc = CounterBloc(CounterState(value: 0));
    });

    test('initial State is 0', () {
      expect(counterBloc.state.value, 0);
    });

    blocTest(
      'on increment event called state value increase by 1',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(OnCounterIncrementPressed()),
      expect: () => [CounterState(value: 1)],
    );

    blocTest(
      'when OnDecrementEvent event is called counterState value should decrease by 1',
      build: () => CounterBloc(CounterState(value: 0)),
      act: (CounterBloc bloc) => bloc.add(OnCounterDecrementPressed()),
      expect: () => [CounterState(value: -1)],
    );

    tearDown(() {
      counterBloc.close();
    });
  });
}
