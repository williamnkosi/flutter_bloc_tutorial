import 'package:bloc/bloc.dart';

class Counterubit extends Cubit<int> {
  Counterubit():super(0);

  void incrementState () => emit(state + 1);
  void decementState () => emit(state - 1);
}