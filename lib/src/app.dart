import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fxbook/src/screens/broker_screen.dart';
import 'package:fxbook/src/screens/main_screen.dart';

import 'blocs/broker_bloc/broker_bloc_provider.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BrokerBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fxbook App',
        builder: (ctx, widget) {
          return MediaQuery(
            data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1),
            child: widget!,
          );
        },
        onGenerateRoute: appRoutes,
        navigatorObservers: [routeObserver],
      ),
    );
  }

  Route appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/broker_screen':
        return CupertinoPageRoute(
          builder: (BuildContext context) {
            return const BrokerScreen();
          },
        );
      case '/':
      default:
        return CupertinoPageRoute(
          builder: (BuildContext context) {
            return const MainScreen();
          },
        );
    }
  }
}
