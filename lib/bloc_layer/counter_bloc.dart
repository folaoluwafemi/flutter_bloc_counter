import 'package:bloc_counter/bloc_layer/counter_event.dart';
import 'package:bloc_counter/model_layer/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterState counterState;

  CounterBloc(this.counterState) : super(counterState) {
    on<OnCounterIncrementPressed>(
        (event, emit){
          CounterState counter = CounterState(value: state.value);
          counter.incrementState();
          return emit(counter);
        });
    on<OnCounterDecrementPressed>(
        (event, emit){
          CounterState counter = CounterState(value: state.value);
          counter.decrementState();
          return emit(counter);
        });
  }
}
