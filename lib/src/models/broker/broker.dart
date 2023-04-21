class Broker {
  final int id;
  final String name;
  final String url;
  final String logo;
  final String description;
  final String brokerType;
  final String country;
  final String year;
  final int employees;
  final String offices;
  final String regulation;
  final String address;
  final String brokerStatus;
  final bool usClients;
  final String accountCurrency;
  final String fundingMethods;
  final bool swapFreeAccounts;
  final bool segregatedAccounts;
  final bool margin;

  Broker({
    required this.id,
    required this.name,
    required this.url,
    required this.logo,
    required this.description,
    required this.brokerType,
    required this.country,
    required this.year,
    required this.employees,
    required this.offices,
    required this.regulation,
    required this.address,
    required this.brokerStatus,
    required this.usClients,
    required this.accountCurrency,
    required this.fundingMethods,
    required this.swapFreeAccounts,
    required this.segregatedAccounts,
    required this.margin,
  });

  factory Broker.fromJson(Map<String, dynamic> json) {
    return Broker(
      id: json['o'],
      name: json['bn'],
      url: json['lu'],
      logo: json['in'],
      description: json['gi'],
      brokerType: json['bt'],
      country: json['pct'],
      year: json['os'],
      employees: json['noe'],
      offices: json['pct'], // change
      regulation: json['rt'],
      address: json['ad'],
      brokerStatus: json['bs'],
      usClients: json['auc'],
      accountCurrency: json['ac'],
      fundingMethods: json['fwm'],
      swapFreeAccounts: json['sfa'],
      segregatedAccounts: json['sega'],
      margin: json['iom'],
    );
  }
}
