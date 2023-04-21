import 'package:flutter/material.dart';
import 'package:fxbook/src/blocs/broker_bloc/broker_bloc_provider.dart';
import 'package:fxbook/src/models/broker/broker.dart';
import 'package:fxbook/src/style/colors.dart';
import 'package:fxbook/src/widgets/my_app_bar.dart';
import 'package:fxbook/src/widgets/my_loader.dart';

class BrokerScreen extends StatelessWidget {
  const BrokerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Broker?>(
        stream: BrokerBlocProvider.of(context).selectedBrokerStream,
        builder: (context, snapshot) {
          if (snapshot.data == null ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: MyLoader());
          }
          if (!snapshot.hasData) {
            return const Text('error');
          }
          return Scaffold(
              backgroundColor: scaffoldBackground,
              resizeToAvoidBottomInset: false,
              appBar: MyAppBar(title: snapshot.data!.name),
              body: _renderBroker(snapshot.data!, context));
        });
  }

  Widget _renderBroker(Broker broker, BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _renderTitle('General Information'),
          _renderDataRow('Broker Type', broker.brokerType, true),
          _renderDataRow('Country', broker.country, false),
          _renderDataRow('Operating since year', broker.year, true),
          _renderDataRow(
              'Number of employees', broker.employees.toString(), false),
          _renderDataRow('International offices', broker.offices, true),
          _renderDataRow('Regulation', broker.regulation, false),
          _renderDataRow('Address', broker.address, true),
          _renderDataRow('Broker Status', broker.brokerStatus, false),
          _renderDataRow(
              'Accepting Us clients?', broker.usClients ? 'Yes' : 'No', true),
          _renderTitle('Account Options'),
          _renderDataRow('Account currency', broker.accountCurrency, true),
          _renderDataRow(
              'Funding/Withdrawal methods:', broker.fundingMethods, false),
          _renderDataRow('Swap free accounts',
              broker.swapFreeAccounts ? 'Yes' : 'No', true),
          _renderDataRow('Segregated accounts',
              broker.segregatedAccounts ? 'Yes' : 'No', false),
          _renderDataRow(
              'Interest on margin', broker.margin ? 'Yes' : 'No', true),
        ],
      ),
    );
  }

  Widget _renderTitle(String text) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.all(12),
      child: Center(child: Text(text, style: brokerTitle)),
    );
  }

  Widget _renderDataRow(String title, String value, bool light) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: light ? lightDataBG : grayDataBG,
      child: Row(
        children: [
          _renderDataTitle(title),
          _renderDataTitle(value),
        ],
      ),
    );
  }

  Widget _renderDataTitle(String title) {
    return Expanded(child: Text(title, style: cardDescStyle));
  }
}
