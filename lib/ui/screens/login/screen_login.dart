import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zephyr/generated/l10n.dart';
import 'package:zephyr/ui/screens/login/style_login.dart';

import 'bloc_login.dart';

class LoginScreen extends StatefulWidget {
  final LoginStyle _style;

  LoginScreen(this._style);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBLoC? _bloc;

  LoginBLoC _initBloc(BuildContext context) {
    var bloc = Provider.of<LoginBLoC>(context)..init();
    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    _bloc ??= _initBloc(context);
    return Scaffold(
      backgroundColor: widget._style.backgroundColor,
        body: Container(
            child: Text(S.of(context).appName,
                style: widget._style.captionTextStyle)));
  }
}
