import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Events
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

// States
enum AuthState { initial, loading, success, error }

class AuthStateData extends Equatable {
  final AuthState state;
  final String message;

  AuthStateData({required this.state, this.message = ''});

  @override
  List<Object> get props => [state, message];
}

class AuthBloc extends Bloc<AuthEvent, AuthStateData> {
  AuthBloc() : super(AuthStateData(state: AuthState.initial)) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthStateData(state: AuthState.loading));

        final response = await http.post(
          Uri.parse("https://dummyjson.com/auth/login"),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'username': event.username,
            'password': event.password,
          }),
        );

        final responseData = json.decode(response.body);

        if (response.statusCode == 200) {
          emit(AuthStateData(state: AuthState.success));
        } else {
          emit(AuthStateData(
            state: AuthState.error,
            message: responseData['error'],
          ));
        }
      } catch (e) {
        emit(
            AuthStateData(state: AuthState.error, message: "An error occured"));
      }
    });
  }
}
