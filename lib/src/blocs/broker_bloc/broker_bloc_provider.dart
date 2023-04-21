import 'package:flutter/material.dart';
import 'broker_bloc.dart';

class BrokerBlocProvider extends InheritedWidget {
  final BrokerBloc bloc;

  BrokerBlocProvider({Key? key, required Widget child})
      : bloc = BrokerBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;

  static BrokerBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BrokerBlocProvider>()!
        .bloc;
  }
}
