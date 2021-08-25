import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:frontend_flutter/providers/auth_provider.dart';

class LoginFormProvider extends ChangeNotifier{

GlobalKey<FormState> formKey = new GlobalKey<FormState>();
// final AuthProvider authProvider;
String email = "";
String password = "";

  // LoginFormProvider(this.authProvider);

validateForm(){
  if(formKey.currentState!.validate()){
    // print('Form valid');
    // print('Email: $email Password: $password');
    // authProvider.login(email, password);
    return true;
  }else{
    // print("Form not valid");
    return false;
  }
  
}
}