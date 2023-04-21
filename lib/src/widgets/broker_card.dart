import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fxbook/src/models/broker/broker.dart';
import 'package:fxbook/src/utils/consts.dart';
import 'package:fxbook/src/utils/endpoints.dart';
import '../style/colors.dart';
import 'my_loader.dart';

class BrokerCard extends StatelessWidget {
  final Broker broker;
  final Function(BuildContext, Broker) onTap;
  const BrokerCard({
    Key? key,
    required this.broker,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, broker),
      child: Card(
        color: cardColor,
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        shadowColor: cardShadowColor,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _renderLogo(),
              const SizedBox(
                width: 8,
              ),
              _renderDetails(),
              // _renderName(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderLogo() {
    return CachedNetworkImage(
      imageUrl: '${EndPoints.logoUrl}/${broker.logo}',
      height: kLogoHeight,
      width: kLogoHeight,
      placeholder: (context, url) =>
          const MyLoader(padding: EdgeInsets.all(40)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _renderDetails() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderName(),
          const SizedBox(
            height: 4,
          ),
          _renderBrokerType(),
          const SizedBox(
            height: 4,
          ),
          _renderRegulation(),
        ],
      ),
    );
  }

  Widget _renderName() {
    return Text(
      broker.name,
      style: cardNameStyle,
    );
  }

  Widget _renderBrokerType() {
    return Text(
      broker.brokerType,
      style: cardDescStyle,
    );
  }

  Widget _renderRegulation() {
    return Text(
      'Regulation By ${broker.regulation}',
      style: cardDescStyle,
      // overflow: TextOverflow.ellipsis,
    );
  }
}
