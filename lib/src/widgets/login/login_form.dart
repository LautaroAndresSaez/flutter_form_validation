import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_block.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/pages/home.dart';
import 'package:form_validation/src/widgets/login/input_field.dart';
import 'package:form_validation/src/widgets/login/submit_button.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: size.height * .25,
            ),
          ),
          Container(
            width: size.width * .85,
            padding: EdgeInsets.symmetric(vertical: 50),
            margin: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 5),
                      spreadRadius: 3)
                ]),
            child: Column(
              children: [
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                InputField(
                  type: TextInputType.emailAddress,
                  iconName: Icons.alternate_email,
                  hintText: 'email@tucorees.com',
                  label: 'Correo electronico',
                  stream: bloc.emailStream,
                  onChanged: bloc.changeEmail,
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                InputField(
                  type: TextInputType.text,
                  iconName: Icons.lock,
                  hintText: '***********',
                  label: 'contraseña',
                  isPassword: true,
                  stream: bloc.passwordStream,
                  onChanged: bloc.changePassword,
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                SubmitButton(
                  stream: bloc.formValidStream,
                  onPressed: () => _login(bloc, context),
                ),
              ],
            ),
          ),
          Text('Olvido su contraseña?'),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    String email = bloc.email;
    String password = bloc.password;
    print('Email: $email \nPassword: $password');
    Navigator.pushReplacementNamed(context, Home.route);
  }
}
