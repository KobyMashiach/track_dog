part of 'register_screen_bloc.dart';

@immutable
abstract class RegisterScreenState {}

final class RegisterScreenInitial extends RegisterScreenState {}

final class RegisterScreenLoading extends RegisterScreenState {}

final class RegisterScreenFinishLoading extends RegisterScreenState {}

@immutable
abstract class RegisterScreenStataNavi extends RegisterScreenState {}

final class RegisterScreenNaviToHomeScreen extends RegisterScreenStataNavi {}

final class RegisterScreenNaviToLoginScreen extends RegisterScreenStataNavi {}

final class RegisterScreenFailedRegister extends RegisterScreenStataNavi {
  final String message;

  RegisterScreenFailedRegister({required this.message});
}
