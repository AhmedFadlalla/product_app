import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/presentation/controller/register_bloc/register_event.dart';
import 'package:product_app/presentation/controller/register_bloc/register_state.dart';

import '../../../core/utils/enum.dart';
import '../../../domain/use_case/user_login_use_case.dart';
import '../../../domain/use_case/user_register_use_case.dart';


class RegisterBloc extends Bloc<BaseRegisterEvent, RegisterState> {
  final UserRegisterUseCase userRegisterUseCase;
  final UserLoginUseCase userLoginUseCase;
  RegisterBloc(this.userRegisterUseCase,this.userLoginUseCase) : super(RegisterState()) {
    on<UserRegisterEvent>((event, emit) async{
      final result=await userRegisterUseCase(UserParameter(

          email: event.email,
          password: event.password,
          name: event.name,));

      result.fold((l) => emit(
        state.copyWith(
          userRegisterState: RequestState.error,
          userRegisterMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          userRegisterState: RequestState.loaded
        )
      ));
    });
    on<UserLoginEvent>((event, emit) async{
      final result=await userLoginUseCase(UserParameter(
        email: event.email,
        password: event.password,
        ));

      result.fold((l) => emit(
          state.copyWith(
              userLoginState: RequestState.error,
              userLoginMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(
              userLoginState: RequestState.loaded,
            userAccessToken: r
          )
      ));
    });
  }
}
