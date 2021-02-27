import 'package:flutter/material.dart';
import 'package:form_validation/src/widgets/login/background_login.dart';
import 'package:form_validation/src/widgets/login/login_form.dart';

class Login extends StatelessWidget {
  static final String route = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [BackgroundLogin(), LoginForm()],
    ));
  }
}
