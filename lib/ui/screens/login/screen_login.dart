import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zephyr/generated/l10n.dart';
import 'package:zephyr/res/theme/zephyr_theme.dart';
import 'package:zephyr/ui/screens/login/style_login.dart';
import 'package:zephyr/ui/widgets/zephyr_button.dart';
import 'package:zephyr/ui/widgets/zephyr_button_style.dart';

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

  bool isEnabledBtn = false;

  @override
  Widget build(BuildContext context) {
    _bloc ??= _initBloc(context);

    ZephyrTheme zephyrTheme = Provider.of<ZephyrTheme>(context);

    void pressBtn() {
      setState(() {
        isEnabledBtn = !isEnabledBtn;
      });
    }

    ZephyrButton btnElevatedEnabled = ZephyrButton(
      style: ZephyrButtonStyle.fromThemeElevated(zephyrTheme),
      text: 'Elevated Enabled>>>',
      onPressed: () => pressBtn(),
    );

    ZephyrButton btnElevatedDisabled = ZephyrButton(
      style: ZephyrButtonStyle.fromThemeElevated(zephyrTheme),
      text: 'Elevated Disabled>>>',
      enabled: isEnabledBtn,
      onPressed: () => pressBtn(),
    );

    ZephyrButton btnOutlinedEnabled = ZephyrButton(
      style: ZephyrButtonStyle.fromThemeOutlined(zephyrTheme),
      text: 'Outlined Enabled>>>',
      onPressed: () => pressBtn(),
    );

    ZephyrButton btnOutlinedDisabled = ZephyrButton(
      style: ZephyrButtonStyle.fromThemeOutlined(zephyrTheme),
      text: 'Outlined Disabled>>>',
      enabled: isEnabledBtn,
      onPressed: () => pressBtn(),
    );

    ZephyrButton btnTextEnabled = ZephyrButton(
      style: ZephyrButtonStyle.fromThemeText(zephyrTheme),
      text: 'Text btn Enabled>>>',
      onPressed: () => pressBtn(),
    );

    ZephyrButton btnTextDisabled = ZephyrButton(
      style: ZephyrButtonStyle.fromThemeText(zephyrTheme),
      text: 'Text btn Disabled>>>',
      enabled: isEnabledBtn,
      onPressed: () => pressBtn(),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).appName,
                  style: widget._style.captionTextStyle),
              SizedBox(height: 10),
              btnElevatedEnabled,
              SizedBox(height: 10),
              btnElevatedDisabled,
              SizedBox(height: 10),
              btnOutlinedEnabled,
              SizedBox(height: 10),
              btnOutlinedDisabled,
              SizedBox(height: 10),
              btnTextEnabled,
              btnTextDisabled,
              ElevatedButton(
                onPressed: () {},
                child: Text('Default style enabled'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('Default style disabled'),
              ),
            ],
          ),
        )));
  }
}
