import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_block.dart';

/* 
  Se implemento un Singelton adicionalmente para la persistencia de datos 
  luego de un hot restart
*/

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();

  static Provider _provider;

  factory Provider({Key key, Widget child}) {
    if (_provider == null) {
      _provider = new Provider._internal(key: key, child: child);
    }

    return _provider;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
}
