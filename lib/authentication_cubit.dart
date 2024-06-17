import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  void onReady() async {
      FlutterNativeSplash.remove();
    final box = Hive.box('storage');
    final isFirstTime = box.get('isFirstTime', defaultValue: true);
    if (kDebugMode) {
      print('********************* when app start ******************');
      print('$isFirstTime');
    }
    // if (isFirstTime) {
    //   await box.put('isFirstTime', false);
    // }
    // emit(AuthenticationReady(isFirstTime: isFirstTime));
  }
}
