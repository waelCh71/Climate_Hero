import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data_services/data_services.dart';
import '../../features/communities/data_services/data_services.dart';

part 'gloabl_event.dart';
part 'gloabl_state.dart';

class GloablBloc extends Bloc<GloablEvent, GloablState> {
  AuthWebServices authWebServices = AuthWebServices();
  GloablBloc() : super(GloablInitial()) {
    on<SignInEvent>((event, emit) async {
      try {
        emit(LoadingEvent());
        var jwtToken = await authWebServices.auth(event.email, event.password);
        var prefs = await SharedPreferences.getInstance();
        print("hi");
        if (jwtToken.startsWith("error")) {
          print("error from bloc");
          emit(AUthenticatedError("error"));
          return;
        } else {
          print("jwt from bloc $jwtToken");
          prefs.setString("jwtToken", jwtToken);
          emit(AUthenticated());
        }
      } catch (e) {
        emit(AUthenticatedError(e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      try {
        emit(LoadingEvent());
        var jwtToken = await authWebServices.register(
            event.username, event.email, event.password);
        var prefs = await SharedPreferences.getInstance();
        print("hi");
        if (jwtToken.startsWith("error")) {
          print("error from bloc");
          emit(AUthenticatedError("error"));
          return;
        } else {
          print("jwt from bloc $jwtToken");
          prefs.setString("jwtToken", jwtToken);
          emit(AUthenticated());
        }
      } catch (e) {
        emit(AUthenticatedError(e.toString()));
      }
    });
  }

  Future<void> checkAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString("jwtToken");
    if (jwtToken != null) {
      emit(AUthenticated());
      //dispose();
    }
  }

  

}
