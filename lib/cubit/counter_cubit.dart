import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));
    void incrementState () => emit(CounterState(counterValue: state.counterValue + 1));
  void decrementState () => emit(CounterState(counterValue: state.counterValue +-1));
}
