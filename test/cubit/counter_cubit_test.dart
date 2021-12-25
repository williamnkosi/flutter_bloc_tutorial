import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_tutorial/cubit/counter_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', (){
    late CounterCubit counterCubit;

    setUp((){
      counterCubit = CounterCubit();
    });

    tearDown((){
      counterCubit.close();
    });

    test("Initial state of counterValue is equal to CounterState(counterValue: 0)", (){
      expect(counterCubit.state, CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest("The cubit should emit a CounterState(counterValue:1,wasIncremented:true) when cubit.incrementState() is called",
     build: () => counterCubit ,
     act:  (CounterCubit cubit) { cubit.incrementState();},
     expect: () => [CounterState(counterValue: 1, wasIncremented: true)]
      );

    blocTest("The cubit should emit a CounterState(counterValue:-1,wasIncremented:true) when cubit.decremented() is called",
     build: () => counterCubit ,
     act:  (CounterCubit cubit) { cubit.decrementState();},
     expect: () => [CounterState(counterValue: -1, wasIncremented: true)]
      );
  });
}