import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppConnectionState {
  final bool isOnline;

  AppConnectionState({required this.isOnline});
}

class ConnectionStateCubit extends Cubit<AppConnectionState> {
  ConnectionStateCubit() : super(AppConnectionState(isOnline: false)) {
    streamSubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (!result.contains(ConnectivityResult.mobile) && !result.contains(ConnectivityResult.wifi)) {
        emit(AppConnectionState(isOnline: false));
      } else {
        emit(AppConnectionState(isOnline: true));
      }
    });
  }

  late final StreamSubscription<List<ConnectivityResult>> streamSubscription;

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
