// File: authentication_state.dart

part of 'authentication_cubit.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class IsFirstTimeState extends AuthenticationState {
  final bool isFirstTime;
  IsFirstTimeState({required this.isFirstTime});
}
