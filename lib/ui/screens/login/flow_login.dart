import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zephyr/data/service_auth.dart';
import 'package:zephyr/res/theme/zephyr_theme.dart';
import 'package:zephyr/ui/screens/login/bloc_login.dart';
import 'package:zephyr/ui/screens/login/screen_login.dart';
import 'package:zephyr/ui/screens/login/style_login.dart';

/** Why do we need flows, better here:
 * https://flutter.dev/docs/cookbook/effects/nested-nav
 */

class LoginFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<LoginBLoC>.value(
              value: LoginBLoC(Provider.of<AuthService>(context)))
        ],
        child: LoginScreen(
            LoginStyle.fromTheme(Provider.of<ZephyrTheme>(context))));
  }

}
