import 'package:equatable/equatable.dart';
import 'package:product_app/core/utils/enum.dart';

import '../../../domain/entities/base_user.dart';

class RegisterState extends Equatable{
  final RequestState userRegisterState;
  final String userRegisterMessage;

  final String userAccessToken;
  final RequestState userLoginState;
  final String userLoginMessage;


  RegisterState({
    this.userRegisterState=RequestState.loading,
    this.userRegisterMessage="",
    this.userAccessToken="",
    this.userLoginState=RequestState.loading,
    this.userLoginMessage=''
  });

  RegisterState copyWith({
     RequestState? userRegisterState,
     String? userRegisterMessage,
    String? userAccessToken,
    RequestState? userLoginState,
    String? userLoginMessage,
}){
    return RegisterState(
    userRegisterState: userRegisterState??this.userRegisterState,
      userRegisterMessage: userRegisterMessage??this.userRegisterMessage,
      userAccessToken: userAccessToken??this.userAccessToken,
      userLoginState: userLoginState??this.userLoginState,
      userLoginMessage: userLoginMessage??this.userRegisterMessage
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [
    userRegisterState,userRegisterMessage,
    userAccessToken,userLoginState,userRegisterMessage
  ];

}
