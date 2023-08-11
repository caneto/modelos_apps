class SubscriptionModel {
  String subscriptionRate;
  List<String> benefitsList;
  String saleTitle;
  SubscriptionModel(
      {required this.subscriptionRate,
      required this.benefitsList,
      required this.saleTitle});
}

List<SubscriptionModel> subscriptionList = [
  SubscriptionModel(
      subscriptionRate: '14.90',
      benefitsList: [
        'Premium reporting & Analytics',
        '24/7 Support Chat',
        '500GB  Cloud memory '
      ],
      saleTitle: 'Platinum'),
  SubscriptionModel(
      subscriptionRate: '9.90',
      benefitsList: [
        'Basic reporting & Analytics',
        'Basic Support Chat',
        '50GB  Cloud memory '
      ],
      saleTitle: 'Diamond'),
  SubscriptionModel(
      subscriptionRate: '0,00',
      benefitsList: [
        'Report only 1 Language ',
        'Basic Support Chat via email',
        '1GB  Cloud memory  '
      ],
      saleTitle: 'Free')
];
