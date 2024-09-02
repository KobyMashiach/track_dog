import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:track_dog/services/firebase/firebase_auth.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<LoginScreenEventLogin>(_loginScreenEventLogin);
    on<LoginScreenEventNavRegisterScreen>(_loginScreenEventNavRegisterScreen);
    on<LoginScreenEventNavForgotPasswordScreen>(
        _loginScreenEventNavForgotPasswordScreen);
    on<LoginScreenEventSendMailRecover>(_loginScreenEventSendMailRecover);
    on<LoginScreenEventNavReportDogScreen>(_loginScreenEventNavReportDogScreen);
  }

  FutureOr<void> _loginScreenEventLogin(
      LoginScreenEventLogin event, Emitter<LoginScreenState> emit) async {
    emit(LoginScreenLoading());
    final String message =
        await loginEmailPassword(event.email, event.password);
    if (message != "") {
      emit(LoginScreenFailedLogin(message: message));
    } else {
      emit(LoginScreenNaviToHomeScreen());
    }
    emit(LoginScreenFinishLoading());
  }

  FutureOr<void> _loginScreenEventNavRegisterScreen(
      LoginScreenEventNavRegisterScreen event, Emitter<LoginScreenState> emit) {
    emit(LoginScreenNaviToRegisterScreen());
  }

  FutureOr<void> _loginScreenEventNavForgotPasswordScreen(
      LoginScreenEventNavForgotPasswordScreen event,
      Emitter<LoginScreenState> emit) {
    emit(LoginScreenNaviToPasswordRecoveryScreen());
  }

  FutureOr<void> _loginScreenEventSendMailRecover(
      LoginScreenEventSendMailRecover event,
      Emitter<LoginScreenState> emit) async {
    emit(LoginScreenLoading());
    final String message = await forgetPassword(event.email);
    if (message != "") {
      emit(LoginScreenFailedSendMail(message: message));
    } else {
      emit(LoginScreenNaviToLoginScreen());
    }
    emit(LoginScreenFinishLoading());
  }

  FutureOr<void> _loginScreenEventNavReportDogScreen(
      LoginScreenEventNavReportDogScreen event,
      Emitter<LoginScreenState> emit) {
    emit(LoginScreenNaviToReportDogScreen());
  }
}
