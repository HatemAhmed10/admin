abstract class Add_Users_States {}

class AddUsersInitialState extends Add_Users_States {}

class SocialRegisterLoadingState extends Add_Users_States {}

class SocialRegisterSuccessState extends Add_Users_States {}

class SocialRegisterErrorState extends Add_Users_States {
  final String error;

  SocialRegisterErrorState(this.error);
}

class SocialCreateUserSuccessState extends Add_Users_States {
  final String uId;

  SocialCreateUserSuccessState(this.uId);
}

class SocialCreateUserErrorState extends Add_Users_States {
  final String error;

  SocialCreateUserErrorState(this.error);
}

class SocialRegisterChangePasswordVisibilityState extends Add_Users_States {}
