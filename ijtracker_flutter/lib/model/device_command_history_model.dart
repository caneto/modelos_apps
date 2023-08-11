class DeviceCommandHistoryModel {
  late int id;
  late String action;
  late String message;
  late String webAndroidIos;
  late String date;

  DeviceCommandHistoryModel({required this.id, required this.action, required this.message, required this.webAndroidIos, required this.date});

  DeviceCommandHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    action = json['action'];
    message = json['message'];
    webAndroidIos = json['webAndroidIos'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['action'] = this.action;
    data['message'] = this.message;
    data['webAndroidIos'] = this.webAndroidIos;
    data['date'] = this.date;
    return data;
  }
}

List<DeviceCommandHistoryModel> deviceCommandHistoryData = [
  DeviceCommandHistoryModel(
    id: 1,
    action: 'Normal mode',
    message: 'Success',
    webAndroidIos: 'Android',
    date: '12 Jul 2020, 14:39',
  ),
  DeviceCommandHistoryModel(
    id: 2,
    action: 'Power saving mode',
    message: 'Success',
    webAndroidIos: 'iOS',
    date: '12 Jul 2020, 12:39',
  ),
  DeviceCommandHistoryModel(
    id: 3,
    action: 'Upload interval',
    message: '20 second',
    webAndroidIos: 'Android',
    date: '12 Jul 2020, 10:39',
  ),
  DeviceCommandHistoryModel(
    id: 4,
    action: 'Update center number',
    message: '+62811888999',
    webAndroidIos: 'Web',
    date: '11 Jul 2020, 14:42',
  ),
  DeviceCommandHistoryModel(
    id: 5,
    action: 'Update center number',
    message: '+62811888999',
    webAndroidIos: 'Android',
    date: '11 Jul 2020, 13:35',
  ),
  DeviceCommandHistoryModel(
    id: 6,
    action: 'Update center number',
    message: '+62811888999',
    webAndroidIos: 'iOS',
    date: '11 Jul 2020, 13:12',
  ),
  DeviceCommandHistoryModel(
    id: 7,
    action: 'Update center number',
    message: '+62811888999',
    webAndroidIos: 'Web',
    date: '12 Jul 2020, 12:19',
  ),
  DeviceCommandHistoryModel(
    id: 8,
    action: 'Update center number',
    message: '+62811888999',
    webAndroidIos: 'Android',
    date: '12 Jul 2020, 10:59',
  ),
  DeviceCommandHistoryModel(
    id: 9,
    action: 'Update center number',
    message: '+62811888999',
    webAndroidIos: 'Android',
    date: '12 Jul 2020, 07:22',
  ),
];