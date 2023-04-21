import 'package:flutter/material.dart';
import 'package:fxbook/src/blocs/broker_bloc/broker_bloc_provider.dart';
import 'package:fxbook/src/models/broker/broker.dart';
import 'package:fxbook/src/widgets/my_app_bar.dart';
import 'package:fxbook/src/widgets/my_list.dart';
import 'package:fxbook/src/widgets/my_loader.dart';
import '../style/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<List<Broker>?>(
          stream: BrokerBlocProvider.of(context).brokersStream,
          builder: (context, snapshot) {
            if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: MyLoader());
            }
            if (snapshot.data?.isEmpty == true || !snapshot.hasData) {
              return const Text('error');
            }
            return MyList(
              snapshot.data!,
              _onBrokerTap,
            );
          }),
      appBar: const MyAppBar(),
    );
  }

  void _onBrokerTap(BuildContext context, Broker broker) {
    BrokerBlocProvider.of(context).onBrokerSelect(broker);
    Navigator.of(context).pushNamed('/broker_screen');
  }
}
