import 'package:fxbook/src/models/broker/broker.dart';
import 'package:fxbook/src/utils/endpoints.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BrokerBloc {
  BrokerBloc() {
    init();
  }
  void init() {
    fetchBrokers();
  }

  final _brokers = BehaviorSubject<List<Broker>?>.seeded(null);
  final _selectedBroker = BehaviorSubject<Broker?>.seeded(null);

  Stream<List<Broker>?> get brokersStream => _brokers.stream;
  Stream<Broker?> get selectedBrokerStream => _selectedBroker.stream;

  dispose() {
    _brokers.close();
    _selectedBroker.close();
  }

  void clear() {
    _brokers.sink.add([]);
    _selectedBroker.sink.add(null);
  }

  Future<void> fetchBrokers() async {
    try {
      final response = await http.get(Uri.parse(EndPoints.brokersUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            json.decode(response.body)['brokerManageArray'];
        final List<Broker> brokers =
            jsonData.map((json) => Broker.fromJson(json)).toList();
        _brokers.sink.add(brokers);
      } else {
        throw Exception('Failed to load brokers');
      }
    } catch (e) {
      _brokers.sink.add([]);
    }
  }

  void onBrokerSelect(Broker broker) {
    _selectedBroker.sink.add(broker);
  }
}
