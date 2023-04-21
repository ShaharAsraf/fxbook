import 'package:flutter/cupertino.dart';
import 'package:fxbook/src/models/broker/broker.dart';

import 'broker_card.dart';

class MyList extends StatefulWidget {
  final List<Broker> brokers;
  final Function(BuildContext, Broker) onTap;

  const MyList(this.brokers, this.onTap, {Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Broker> brokers = [];

  @override
  void initState() {
    initItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (brokers.isEmpty) {
      return const Center(
        child: Text('No items'),
      );
    }
    return AnimatedList(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
      key: _listKey,
      shrinkWrap: true,
      initialItemCount: brokers.length,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) =>
              _buildItem(brokers[index], index, animation),
    );
  }

  Widget _buildItem(
      Broker removedItem, int index, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: BrokerCard(
        broker: removedItem,
        onTap: widget.onTap,
      ),
    );
  }

  void initItems() async {
    for (Broker item in widget.brokers) {
      brokers.add(item);
      _listKey.currentState?.insertItem(brokers.length - 1);
      await Future.delayed(const Duration(milliseconds: 250));
    }
  }
}
