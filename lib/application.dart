import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:zephyr/data/api/api_auth.dart';
import 'package:zephyr/ui/behavior/behavior_scroll.dart';
import 'router.dart';
import 'data/service_auth.dart';
import 'environment.dart';
import 'generated/l10n.dart';
import 'res/theme/zephyr_theme.dart';

class Application extends StatelessWidget {
  final Environment env;

  const Application({Key? key, required this.env}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    // Application base theme
    final theme = ZephyrTheme.defaultTheme();
    // Application rest client, graphql client also will be added if necessary
    final dioLogger = PrettyDioLogger(
        requestHeader: env.logOptions.requestHeader,
        requestBody: env.logOptions.requestBody,
        responseBody: env.logOptions.responseBody,
        responseHeader: env.logOptions.responseHeader,
        error: true,
        compact: true,
        maxWidth: 90
    );
    final dio = Dio(BaseOptions(baseUrl: env.apiUrl))..interceptors.add(dioLogger);
    // Api's section
    final authApi = AuthApi(dio);
    // Base init section
    return MultiProvider(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: ZephyrScrollBehavior(),
            child: child ?? Container(),
          );
        },
        providers: [
          Provider<Environment>.value(value: env),
          Provider<ZephyrTheme>.value(value: theme),
          Provider<AuthService>.value(value: AuthService(authApi)),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: (settings) {
              return appRouter.dispatchRoute(settings);
            },
            initialRoute: AppRouter.routeLogin,
          theme: ThemeData(
              fontFamily: 'Lato',
              textTheme: TextTheme(
                  headline1: theme.textStyles.h1.get(),
                  headline2: theme.textStyles.h2.get(),
                  headline3: theme.textStyles.h3.get(),
                  bodyText1: theme.textStyles.b1.get()))
        ));
  }
}
