import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
      connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((event) {
        if(event == ConnectivityResult.wifi){
          emitInternetConnected(ConnectivityType.wifi);
        } else if(event == ConnectivityResult.mobile){
          emitInternetConnected(ConnectivityType.mobile);
        } else if (event == ConnectivityResult.none){
          emitInternetDisconected();
        }
      });
  }

  void emitInternetConnected(ConnectivityType _connectionType) => emit(InternetConnected(connectivityType: _connectionType));
  void emitInternetDisconected() => emit(InternetDisconnect());
  
  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
