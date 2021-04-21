import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zephyr/generated/l10n.dart';
import 'package:zephyr/res/dimens.dart';
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
  bool _obscureText = true;
  bool? _checkbox = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onCheckboxChange(bool? value) {
    setState(() {
      _checkbox = value;
    });
  }

  LoginBLoC _initBloc(BuildContext context) {
    var bloc = Provider.of<LoginBLoC>(context)..init();
    return bloc;
  }

  Widget loginContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.borderRadius18),
          topRight: Radius.circular(Dimens.borderRadius18),
        ),
        boxShadow: [widget._style.loginContainerBoxShadow],
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimens.paddingM,
          top: Dimens.paddingXL,
          right: Dimens.paddingM,
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).login,
                style: widget._style.titleTextStyle,
              ),
              SizedBox(
                height: Dimens.grid32,
              ),
              Container(
                height: Dimens.grid48,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: widget._style.textFieldTextStyle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.borderRadius4),
                      ),
                    ),
                    labelText: S.of(context).email,
                  ),
                ),
              ),
              SizedBox(
                height: Dimens.grid24,
              ),
              Container(
                height: Dimens.grid48,
                child: TextFormField(
                  style: widget._style.textFieldTextStyle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.borderRadius4),
                      ),
                    ),
                    suffix: GestureDetector(
                        onTap: _toggle,
                        child: Image.asset("assets/visibility.png")),
                    labelText: S.of(context).password,
                  ),
                  obscureText: _obscureText,
                ),
              ),
              SizedBox(
                height: Dimens.grid24,
              ),
              Row(
                children: [
                  SizedBox(
                    height: Dimens.grid20,
                    width: Dimens.grid20,
                    child: Checkbox(
                      value: _checkbox,
                      onChanged: _onCheckboxChange,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.grid8,
                  ),
                  Text(
                    S.of(context).rememberMe,
                    style: widget._style.rememberMeTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: Dimens.grid40,
              ),
              Container(
                width: double.infinity,
                height: Dimens.grid48,
                decoration: BoxDecoration(
                  color: widget._style.loginButtonColor,
                  borderRadius: BorderRadius.circular(Dimens.borderRadius4),
                ),
                child: ElevatedButton(
                  onPressed: _bloc?.loginClick,
                  child: Text(
                    S.of(context).login,
                    style: widget._style.loginButtonTextStyle,
                  ),
                ),
              ),
              SizedBox(height: Dimens.grid44)
            ],
          ),
        ),
      ),
    );
  }

  Widget logo(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset("assets/logo.png"),
    );
  }

  @override
  Widget build(BuildContext context) {
    _bloc ??= _initBloc(context);

    // ZephyrTheme zephyrTheme = Provider.of<ZephyrTheme>(context);
    //
    // void pressBtn() {
    //   setState(() {
    //     isEnabledBtn = !isEnabledBtn;
    //   });
    // }
    //
    // ZephyrButton btnElevatedEnabled = ZephyrButton(
    //   style: ZephyrButtonStyle.fromThemeElevated(zephyrTheme),
    //   text: 'Elevated Enabled>>>',
    //   onPressed: () => pressBtn(),
    // );
    //
    // ZephyrButton btnElevatedDisabled = ZephyrButton(
    //   style: ZephyrButtonStyle.fromThemeElevated(zephyrTheme),
    //   text: 'Elevated Disabled>>>',
    //   enabled: isEnabledBtn,
    //   onPressed: () => pressBtn(),
    // );
    //
    // ZephyrButton btnOutlinedEnabled = ZephyrButton(
    //   style: ZephyrButtonStyle.fromThemeOutlined(zephyrTheme),
    //   text: 'Outlined Enabled>>>',
    //   onPressed: () => pressBtn(),
    // );
    //
    // ZephyrButton btnOutlinedDisabled = ZephyrButton(
    //   style: ZephyrButtonStyle.fromThemeOutlined(zephyrTheme),
    //   text: 'Outlined Disabled>>>',
    //   enabled: isEnabledBtn,
    //   onPressed: () => pressBtn(),
    // );
    //
    // ZephyrButton btnTextEnabled = ZephyrButton(
    //   style: ZephyrButtonStyle.fromThemeText(zephyrTheme),
    //   text: 'Text btn Enabled>>>',
    //   onPressed: () => pressBtn(),
    // );
    //
    // ZephyrButton btnTextDisabled = ZephyrButton(
    //   style: ZephyrButtonStyle.fromThemeText(zephyrTheme),
    //   text: 'Text btn Disabled>>>',
    //   enabled: isEnabledBtn,
    //   onPressed: () => pressBtn(),
    // );

    return Scaffold(
      backgroundColor: widget._style.backgroundColor,
      body: Container(
        child: SafeArea(
          bottom: false,
          top: false,
          child: LayoutBuilder(
            builder: (context, constraint) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: Dimens.grid120),
                      logo(context),
                      loginContainer(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
