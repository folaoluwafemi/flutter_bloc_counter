

import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  int value = 0;

  CounterState({
    required this.value,
  });



  set(int newValue) {
    value = newValue;
  }

  CounterState incrementState(){
    value++;
    return this;
  }


  CounterState decrementState(){
    value--;
    return this;
  }

  @override
  List<Object?> get props => [value];


}
