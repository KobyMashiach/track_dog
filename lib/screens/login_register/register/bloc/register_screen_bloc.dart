import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:track_dog/services/firebase/firebase_auth.dart';

part 'register_screen_event.dart';
part 'register_screen_state.dart';

class RegisterScreenBloc
    extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  RegisterScreenBloc() : super(RegisterScreenInitial()) {
    on<RegisterScreenEventRegister>(_registerScreenEventLogin);
    on<RegisterScreenEventNavLoginScreen>(_registerScreenEventNavLoginScreen);
  }

  FutureOr<void> _registerScreenEventLogin(RegisterScreenEventRegister event,
      Emitter<RegisterScreenState> emit) async {
    emit(RegisterScreenLoading());
    final String message =
        await registerEmailPassword(event.email, event.password);
    if (message != "") {
      emit(RegisterScreenFailedRegister(message: message));
    } else {
      emit(RegisterScreenNaviToHomeScreen());
    }
    emit(RegisterScreenFinishLoading());
  }

  FutureOr<void> _registerScreenEventNavLoginScreen(
      RegisterScreenEventNavLoginScreen event,
      Emitter<RegisterScreenState> emit) {
    emit(RegisterScreenNaviToLoginScreen());
  }
}
