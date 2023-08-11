class NotificationModel {
  late int id;
  late String message;
  late String notifDate;

  NotificationModel({required this.id, required this.message, required this.notifDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    notifDate = json['notifDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['notifDate'] = this.notifDate;
    return data;
  }
}

List<NotificationModel> notificationData = [
  NotificationModel(
      id: 1,
      message: 'Your GPS <b>B 2455 UJD</b> with Serial Number 7018089100 is out of fence! <b>[Auto Geofence]</b>',
      notifDate: '28 Jul 2020, 10:00',
  ),
  NotificationModel(
      id: 2,
      message: 'Your GPS <b>B 2455 UJD</b> with Serial Number <b>7018089100</b> is offline',
      notifDate: '28 Jul 2020, 10:00',
  ),
  NotificationModel(
      id: 3,
      message: 'Your GPS <b>B 2455 UJD</b> with Serial Number <b>7018089100</b> has low power and already off! <b>[0%]</b>. Charge it immediately !',
      notifDate: '28 Jul 2020, 10:00',
  ),
  NotificationModel(
      id: 4,
      message: 'Your GPS <b>B 2455 UJD</b> with Serial Number <b>7018089100</b> is <b>Expired</b> ! Please contact <b>iJTracker</b> to renew.',
      notifDate: '28 Jul 2020, 10:00',
  ),
  NotificationModel(
      id: 5,
      message: 'Your GPS <b>B 2455 UJD</b> with Serial Number <b>7018089100</b> is <b>Expired</b> ! Please contact <b>iJTracker</b> to renew.',
      notifDate: '28 Jul 2020, 10:00',
  ),
  NotificationModel(
      id: 6,
      message: 'Your GPS <b>B 2455 UJD</b> with Serial Number <b>7018089100</b> is <b>Expired</b> ! Please contact <b>iJTracker</b> to renew.',
      notifDate: '28 Jul 2020, 10:00',
  ),
  NotificationModel(
      id: 7,
      message: 'Your GPS <b>B 2455 UJD</b> with Serial Number <b>7018089100</b> is <b>Expired</b> ! Please contact <b>iJTracker</b> to renew.',
      notifDate: '28 Jul 2020, 10:00',
  ),
];