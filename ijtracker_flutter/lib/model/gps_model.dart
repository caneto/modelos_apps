/*
this is gps_model pages
used in history_map.dart
 */

class GpsModel {
  late String speed;
  late int direction;
  late int battery;
  late String gpsDate;
  late String mileage;
  late String stopTime;
  late double lat;
  late double long;

  GpsModel({required this.speed, required this.direction, required this.battery, required this.gpsDate, required this.mileage, required this.stopTime, required this.lat, required this.long});

  GpsModel.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    direction = json['direction'];
    battery = json['battery'];
    gpsDate = json['gpsDate'];
    mileage = json['mileage'];
    stopTime = json['stopTime'];
    lat = json['lat'].toDouble();
    long = json['long'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['direction'] = this.direction;
    data['battery'] = this.battery;
    data['gpsDate'] = this.gpsDate;
    data['mileage'] = this.mileage;
    data['stopTime'] = this.stopTime;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

List<GpsModel> historyGpsData =[
  GpsModel(
      speed: '26.68 Km/h',
      direction: 288,
      battery: 100,
      gpsDate: '2019-10-12 01:05:53',
      mileage: '1.2 km',
      stopTime: '',
      lat: -6.1529818,
      long: 106.9065
  ),
  GpsModel(
      speed: '40.13 Km/h',
      direction: 300,
      battery: 100,
      gpsDate: '2019-10-12 01:06:13',
      mileage: '1.42 km',
      stopTime: '',
      lat: -6.1518784,
      long: 106.904816
  ),
  GpsModel(
      speed: '34.8 Km/h',
      direction: 297,
      battery: 100,
      gpsDate: '2019-10-12 01:06:33',
      mileage: '1.61 km',
      stopTime: '',
      lat: -6.150978,
      long: 106.90332
  ),
  GpsModel(
      speed: '27.6 Km/h',
      direction: 303,
      battery: 100,
      gpsDate: '2019-10-12 01:07:33',
      mileage: '2.07 km',
      stopTime: '',
      lat: -6.14868,
      long: 106.89986
  ),
  GpsModel(
      speed: '21.86 Km/h',
      direction: 287,
      battery: 100,
      gpsDate: '2019-10-12 01:07:53',
      mileage: '2.2 km',
      stopTime: '',
      lat: -6.14783,
      long: 106.89917
  ),
  GpsModel(
      speed: '30.6 Km/h',
      direction: 295,
      battery: 100,
      gpsDate: '2019-10-12 01:08:12',
      mileage: '2.36 km',
      stopTime: '',
      lat: -6.147168,
      long: 106.89787
  ),
  GpsModel(
      speed: '28.39 Km/h',
      direction: 296,
      battery: 100,
      gpsDate: '2019-10-12 01:08:32',
      mileage: '2.51 km',
      stopTime: '',
      lat: -6.1464667,
      long: 106.89663
  ),
  GpsModel(
      speed: '36.45 Km/h',
      direction: 299,
      battery: 100,
      gpsDate: '2019-10-12 01:08:52',
      mileage: '2.72 km',
      stopTime: '',
      lat: -6.1456165,
      long: 106.89501
  ),
  GpsModel(
      speed: '34.63 Km/h',
      direction: 297,
      battery: 100,
      gpsDate: '2019-10-12 01:09:06',
      mileage: '2.85 km',
      stopTime: '',
      lat: -6.145045,
      long: 106.893936
  ),
  GpsModel(
      speed: '27.88 Km/h',
      direction: 292,
      battery: 100,
      gpsDate: '2019-10-12 01:09:12',
      mileage: '2.9 km',
      stopTime: '',
      lat: -6.1448684,
      long: 106.893555
  ),
  GpsModel(
      speed: '26.61 Km/h',
      direction: 298,
      battery: 100,
      gpsDate: '2019-10-12 01:09:32',
      mileage: '3.05 km',
      stopTime: '',
      lat: -6.144252,
      long: 106.89237
  ),
  GpsModel(
      speed: '19.58 Km/h',
      direction: 286,
      battery: 100,
      gpsDate: '2019-10-12 01:09:52',
      mileage: '3.15 km',
      stopTime: '',
      lat: -6.143835,
      long: 106.89148
  ),
  GpsModel(
      speed: '18.49 Km/h',
      direction: 192,
      battery: 100,
      gpsDate: '2019-10-12 01:11:11',
      mileage: '3.56 km',
      stopTime: '',
      lat: -6.1471434,
      long: 106.88993
  ),
  GpsModel(
      speed: '28.49 Km/h',
      direction: 217,
      battery: 100,
      gpsDate: '2019-10-12 01:11:31',
      mileage: '3.72 km',
      stopTime: '',
      lat: -6.1485415,
      long: 106.88966
  ),
  GpsModel(
      speed: '15.79 Km/h',
      direction: 201,
      battery: 100,
      gpsDate: '2019-10-12 01:12:11',
      mileage: '3.89 km',
      stopTime: '',
      lat: -6.1499968,
      long: 106.889046
  ),
  GpsModel(
      speed: '49.13 Km/h',
      direction: 213,
      battery: 100,
      gpsDate: '2019-10-12 01:12:31',
      mileage: '4.17 km',
      stopTime: '',
      lat: -6.1521215,
      long: 106.88781
  ),
  GpsModel(
      speed: '69.58 Km/h',
      direction: 211,
      battery: 100,
      gpsDate: '2019-10-12 01:12:50',
      mileage: '4.53 km',
      stopTime: '',
      lat: -6.154947,
      long: 106.88609
  ),
  GpsModel(
      speed: '74.53 Km/h',
      direction: 210,
      battery: 100,
      gpsDate: '2019-10-12 01:13:10',
      mileage: '4.95 km',
      stopTime: '',
      lat: -6.158135,
      long: 106.884155
  ),
  GpsModel(
      speed: '80.21 Km/h',
      direction: 211,
      battery: 100,
      gpsDate: '2019-10-12 01:13:30',
      mileage: '5.39 km',
      stopTime: '',
      lat: -6.1615767,
      long: 106.88209
  ),
  GpsModel(
      speed: '81.45 Km/h',
      direction: 212,
      battery: 100,
      gpsDate: '2019-10-12 01:13:50',
      mileage: '5.85 km',
      stopTime: '',
      lat: -6.1650085,
      long: 106.87989
  ),
  GpsModel(
      speed: '73.99 Km/h',
      direction: 184,
      battery: 100,
      gpsDate: '2019-10-12 01:15:29',
      mileage: '7.88 km',
      stopTime: '',
      lat: -6.1828265,
      long: 106.875694
  ),
  GpsModel(
      speed: '75.11 Km/h',
      direction: 182,
      battery: 100,
      gpsDate: '2019-10-12 01:15:49',
      mileage: '8.3 km',
      stopTime: '',
      lat: -6.186575,
      long: 106.87552
  ),
  GpsModel(
      speed: '70.07 Km/h',
      direction: 182,
      battery: 100,
      gpsDate: '2019-10-12 01:16:09',
      mileage: '8.69 km',
      stopTime: '',
      lat: -6.1900735,
      long: 106.87539
  ),
  GpsModel(
      speed: '70.85 Km/h',
      direction: 192,
      battery: 100,
      gpsDate: '2019-10-12 01:16:29',
      mileage: '9.08 km',
      stopTime: '',
      lat: -6.1935782,
      long: 106.87489
  ),
  GpsModel(
      speed: '68.1 Km/h',
      direction: 190,
      battery: 100,
      gpsDate: '2019-10-12 01:16:49',
      mileage: '9.46 km',
      stopTime: '',
      lat: -6.1969185,
      long: 106.87424
  ),
  GpsModel(
      speed: '77.78 Km/h',
      direction: 179,
      battery: 100,
      gpsDate: '2019-10-12 01:17:48',
      mileage: '10.73 km',
      stopTime: '',
      lat: -6.2083783,
      long: 106.87396
  ),
  GpsModel(
      speed: '77.35 Km/h',
      direction: 176,
      battery: 100,
      gpsDate: '2019-10-12 01:18:08',
      mileage: '11.16 km',
      stopTime: '',
      lat: -6.21224,
      long: 106.87411
  ),
  GpsModel(
      speed: '80.88 Km/h',
      direction: 177,
      battery: 100,
      gpsDate: '2019-10-12 01:18:28',
      mileage: '11.61 km',
      stopTime: '',
      lat: -6.2162786,
      long: 106.87425
  ),
  GpsModel(
      speed: '72.72 Km/h',
      direction: 177,
      battery: 100,
      gpsDate: '2019-10-12 01:18:48',
      mileage: '12.02 km',
      stopTime: '',
      lat: -6.219908,
      long: 106.87442
  ),
  GpsModel(
      speed: '64.44 Km/h',
      direction: 174,
      battery: 100,
      gpsDate: '2019-10-12 01:19:08',
      mileage: '12.38 km',
      stopTime: '',
      lat: -6.22312,
      long: 106.87464
  ),
  GpsModel(
      speed: '65.21 Km/h',
      direction: 168,
      battery: 100,
      gpsDate: '2019-10-12 01:19:28',
      mileage: '12.74 km',
      stopTime: '',
      lat: -6.226343,
      long: 106.87512
  ),
  GpsModel(
      speed: '67.12 Km/h',
      direction: 166,
      battery: 100,
      gpsDate: '2019-10-12 01:19:40',
      mileage: '12.96 km',
      stopTime: '',
      lat: -6.228307,
      long: 106.87556
  ),
  GpsModel(
      speed: '70.65 Km/h',
      direction: 165,
      battery: 100,
      gpsDate: '2019-10-12 01:19:48',
      mileage: '13.12 km',
      stopTime: '',
      lat: -6.2296815,
      long: 106.875885
  ),
  GpsModel(
      speed: '80.54 Km/h',
      direction: 166,
      battery: 100,
      gpsDate: '2019-10-12 01:20:07',
      mileage: '13.54 km',
      stopTime: '',
      lat: -6.233392,
      long: 106.87681
  ),
  GpsModel(
      speed: '80.24 Km/h',
      direction: 165,
      battery: 100,
      gpsDate: '2019-10-12 01:20:27',
      mileage: '13.99 km',
      stopTime: '',
      lat: -6.237282,
      long: 106.877785
  ),
  GpsModel(
      speed: '65.54 Km/h',
      direction: 202,
      battery: 100,
      gpsDate: '2019-10-12 01:20:47',
      mileage: '14.35 km',
      stopTime: '',
      lat: -6.240555,
      long: 106.877884
  ),
  GpsModel(
      speed: '71.38 Km/h',
      direction: 177,
      battery: 100,
      gpsDate: '2019-10-12 01:21:07',
      mileage: '14.75 km',
      stopTime: '',
      lat: -6.2440667,
      long: 106.87726
  ),
  GpsModel(
      speed: '70.51 Km/h',
      direction: 203,
      battery: 100,
      gpsDate: '2019-10-12 01:21:27',
      mileage: '15.14 km',
      stopTime: '',
      lat: -6.2475767,
      long: 106.87696
  ),
  GpsModel(
      speed: '62.23 Km/h',
      direction: 231,
      battery: 100,
      gpsDate: '2019-10-12 01:21:47',
      mileage: '15.49 km',
      stopTime: '',
      lat: -6.250147,
      long: 106.8752
  ),
  GpsModel(
      speed: '69.72 Km/h',
      direction: 201,
      battery: 100,
      gpsDate: '2019-10-12 01:22:07',
      mileage: '15.87 km',
      stopTime: '',
      lat: -6.252775,
      long: 106.8729
  ),
  GpsModel(
      speed: '77.36 Km/h',
      direction: 162,
      battery: 100,
      gpsDate: '2019-10-12 01:22:26',
      mileage: '16.28 km',
      stopTime: '',
      lat: -6.256435,
      long: 106.872604
  ),
  GpsModel(
      speed: '68.23 Km/h',
      direction: 179,
      battery: 100,
      gpsDate: '2019-10-12 01:22:46',
      mileage: '16.66 km',
      stopTime: '',
      lat: -6.259775,
      long: 106.87329
  ),
  GpsModel(
      speed: '66.47 Km/h',
      direction: 183,
      battery: 100,
      gpsDate: '2019-10-12 01:23:06',
      mileage: '17.03 km',
      stopTime: '',
      lat: -6.2630935,
      long: 106.87316
  ),
  GpsModel(
      speed: '68.28 Km/h',
      direction: 173,
      battery: 100,
      gpsDate: '2019-10-12 01:23:26',
      mileage: '17.41 km',
      stopTime: '',
      lat: -6.2665014,
      long: 106.873314
  ),
  GpsModel(
      speed: '68.99 Km/h',
      direction: 185,
      battery: 100,
      gpsDate: '2019-10-12 01:23:46',
      mileage: '17.79 km',
      stopTime: '',
      lat: -6.26991,
      long: 106.8728
  ),
  GpsModel(
      speed: '61.88 Km/h',
      direction: 171,
      battery: 100,
      gpsDate: '2019-10-12 01:24:06',
      mileage: '18.14 km',
      stopTime: '',
      lat: -6.273,
      long: 106.872894
  ),
  GpsModel(
      speed: '66.35 Km/h',
      direction: 161,
      battery: 100,
      gpsDate: '2019-10-12 01:24:26',
      mileage: '18.51 km',
      stopTime: '',
      lat: -6.276242,
      long: 106.87359
  ),
  GpsModel(
      speed: '70.18 Km/h',
      direction: 156,
      battery: 100,
      gpsDate: '2019-10-12 01:24:37',
      mileage: '18.72 km',
      stopTime: '',
      lat: -6.278052,
      long: 106.87426
  ),
  GpsModel(
      speed: '58.83 Km/h',
      direction: 157,
      battery: 100,
      gpsDate: '2019-10-12 01:24:45',
      mileage: '18.85 km',
      stopTime: '',
      lat: -6.2791433,
      long: 106.8747
  ),
  GpsModel(
      speed: '62.61 Km/h',
      direction: 158,
      battery: 100,
      gpsDate: '2019-10-12 01:25:05',
      mileage: '19.2 km',
      stopTime: '',
      lat: -6.2820415,
      long: 106.875885
  ),
  GpsModel(
      speed: '55.04 Km/h',
      direction: 157,
      battery: 100,
      gpsDate: '2019-10-12 01:25:25',
      mileage: '19.51 km',
      stopTime: '',
      lat: -6.2845917,
      long: 106.87692
  ),
  GpsModel(
      speed: '73.99 Km/h',
      direction: 157,
      battery: 100,
      gpsDate: '2019-10-12 01:25:45',
      mileage: '19.92 km',
      stopTime: '',
      lat: -6.287998,
      long: 106.878365
  ),
  GpsModel(
      speed: '73.7 Km/h',
      direction: 157,
      battery: 100,
      gpsDate: '2019-10-12 01:26:05',
      mileage: '20.33 km',
      stopTime: '',
      lat: -6.291405,
      long: 106.87977
  ),
  GpsModel(
      speed: '58.38 Km/h',
      direction: 155,
      battery: 100,
      gpsDate: '2019-10-12 01:26:25',
      mileage: '20.65 km',
      stopTime: '',
      lat: -6.294105,
      long: 106.88088
  ),
  GpsModel(
      speed: '60.42 Km/h',
      direction: 158,
      battery: 100,
      gpsDate: '2019-10-12 01:26:45',
      mileage: '20.99 km',
      stopTime: '',
      lat: -6.2968783,
      long: 106.88208
  ),
  GpsModel(
      speed: '54.73 Km/h',
      direction: 161,
      battery: 100,
      gpsDate: '2019-10-12 01:27:04',
      mileage: '21.27 km',
      stopTime: '',
      lat: -6.2993135,
      long: 106.88299
  ),
  GpsModel(
      speed: '13.27 Km/h',
      direction: 171,
      battery: 100,
      gpsDate: '2019-10-12 01:27:44',
      mileage: '21.42 km',
      stopTime: '',
      lat: -6.30059,
      long: 106.88335
  ),
  GpsModel(
      speed: '47.77 Km/h',
      direction: 172,
      battery: 100,
      gpsDate: '2019-10-12 01:28:04',
      mileage: '21.69 km',
      stopTime: '',
      lat: -6.3028984,
      long: 106.88396
  ),
  GpsModel(
      speed: '48.74 Km/h',
      direction: 125,
      battery: 100,
      gpsDate: '2019-10-12 01:28:24',
      mileage: '21.96 km',
      stopTime: '',
      lat: -6.304545,
      long: 106.885765
  ),
  GpsModel(
      speed: '35.04 Km/h',
      direction: 251,
      battery: 100,
      gpsDate: '2019-10-12 01:28:44',
      mileage: '22.15 km',
      stopTime: '',
      lat: -6.3062334,
      long: 106.88623
  ),
  GpsModel(
      speed: '63.84 Km/h',
      direction: 270,
      battery: 100,
      gpsDate: '2019-10-12 01:29:04',
      mileage: '22.51 km',
      stopTime: '',
      lat: -6.306053,
      long: 106.883026
  ),
  GpsModel(
      speed: '70.56 Km/h',
      direction: 254,
      battery: 100,
      gpsDate: '2019-10-12 01:29:23',
      mileage: '22.88 km',
      stopTime: '',
      lat: -6.306588,
      long: 106.8797
  ),
  GpsModel(
      speed: '73.46 Km/h',
      direction: 255,
      battery: 100,
      gpsDate: '2019-10-12 01:29:35',
      mileage: '23.12 km',
      stopTime: '',
      lat: -6.30712,
      long: 106.87755
  ),
  GpsModel(
      speed: '77.33 Km/h',
      direction: 255,
      battery: 100,
      gpsDate: '2019-10-12 01:29:43',
      mileage: '23.3 km',
      stopTime: '',
      lat: -6.3075085,
      long: 106.876045
  ),
  GpsModel(
      speed: '67.65 Km/h',
      direction: 258,
      battery: 100,
      gpsDate: '2019-10-12 01:30:03',
      mileage: '23.67 km',
      stopTime: '',
      lat: -6.3083434,
      long: 106.87275
  ),
  GpsModel(
      speed: '72.65 Km/h',
      direction: 290,
      battery: 100,
      gpsDate: '2019-10-12 01:30:23',
      mileage: '24.08 km',
      stopTime: '',
      lat: -6.30846,
      long: 106.8691
  ),
  GpsModel(
      speed: '74.01 Km/h',
      direction: 296,
      battery: 100,
      gpsDate: '2019-10-12 01:30:43',
      mileage: '24.49 km',
      stopTime: '',
      lat: -6.306852,
      long: 106.86575
  ),
  GpsModel(
      speed: '75.86 Km/h',
      direction: 270,
      battery: 100,
      gpsDate: '2019-10-12 01:31:03',
      mileage: '24.91 km',
      stopTime: '',
      lat: -6.30552,
      long: 106.86218
  ),
  GpsModel(
      speed: '76.36 Km/h',
      direction: 266,
      battery: 100,
      gpsDate: '2019-10-12 01:31:23',
      mileage: '25.33 km',
      stopTime: '',
      lat: -6.3056784,
      long: 106.858345
  ),
  GpsModel(
      speed: '79.83 Km/h',
      direction: 295,
      battery: 100,
      gpsDate: '2019-10-12 01:31:42',
      mileage: '25.75 km',
      stopTime: '',
      lat: -6.3051085,
      long: 106.854576
  ),
  GpsModel(
      speed: '81.42 Km/h',
      direction: 269,
      battery: 100,
      gpsDate: '2019-10-12 01:32:02',
      mileage: '26.21 km',
      stopTime: '',
      lat: -6.3043785,
      long: 106.85055
  ),
  GpsModel(
      speed: '77.51 Km/h',
      direction: 276,
      battery: 100,
      gpsDate: '2019-10-12 01:32:22',
      mileage: '26.64 km',
      stopTime: '',
      lat: -6.3041015,
      long: 106.846664
  ),
  GpsModel(
      speed: '78.78 Km/h',
      direction: 279,
      battery: 100,
      gpsDate: '2019-10-12 01:32:42',
      mileage: '27.07 km',
      stopTime: '',
      lat: -6.3036118,
      long: 106.842735
  ),
  GpsModel(
      speed: '80.49 Km/h',
      direction: 287,
      battery: 100,
      gpsDate: '2019-10-12 01:33:02',
      mileage: '27.52 km',
      stopTime: '',
      lat: -6.3027835,
      long: 106.838776
  ),
  GpsModel(
      speed: '85.25 Km/h',
      direction: 305,
      battery: 100,
      gpsDate: '2019-10-12 01:33:22',
      mileage: '28 km',
      stopTime: '',
      lat: -6.3007884,
      long: 106.83499
  ),
  GpsModel(
      speed: '73.54 Km/h',
      direction: 291,
      battery: 100,
      gpsDate: '2019-10-12 01:34:41',
      mileage: '29.61 km',
      stopTime: '',
      lat: -6.293825,
      long: 106.82218
  ),
  GpsModel(
      speed: '56.92 Km/h',
      direction: 291,
      battery: 100,
      gpsDate: '2019-10-12 01:34:44',
      mileage: '29.66 km',
      stopTime: '',
      lat: -6.2936583,
      long: 106.821785
  ),
  GpsModel(
      speed: '63.79 Km/h',
      direction: 286,
      battery: 100,
      gpsDate: '2019-10-12 01:35:01',
      mileage: '29.96 km',
      stopTime: '',
      lat: -6.292715,
      long: 106.81923
  ),
  GpsModel(
      speed: '63.03 Km/h',
      direction: 270,
      battery: 100,
      gpsDate: '2019-10-12 01:35:21',
      mileage: '30.31 km',
      stopTime: '',
      lat: -6.2923265,
      long: 106.816086
  ),
  GpsModel(
      speed: '40.15 Km/h',
      direction: 272,
      battery: 100,
      gpsDate: '2019-10-12 01:35:41',
      mileage: '30.53 km',
      stopTime: '',
      lat: -6.292238,
      long: 106.81407
  ),
  GpsModel(
      speed: '47.95 Km/h',
      direction: 268,
      battery: 100,
      gpsDate: '2019-10-12 01:36:01',
      mileage: '30.8 km',
      stopTime: '',
      lat: -6.292195,
      long: 106.81166
  ),
  GpsModel(
      speed: '62.35 Km/h',
      direction: 267,
      battery: 100,
      gpsDate: '2019-10-12 01:36:20',
      mileage: '31.13 km',
      stopTime: '',
      lat: -6.2923083,
      long: 106.808685
  ),
  GpsModel(
      speed: '42.72 Km/h',
      direction: 268,
      battery: 100,
      gpsDate: '2019-10-12 01:36:40',
      mileage: '31.36 km',
      stopTime: '',
      lat: -6.29241,
      long: 106.80654
  ),
  GpsModel(
      speed: '46.77 Km/h',
      direction: 269,
      battery: 100,
      gpsDate: '2019-10-12 01:37:00',
      mileage: '31.62 km',
      stopTime: '',
      lat: -6.2924666,
      long: 106.80419
  ),
  GpsModel(
      speed: '51.13 Km/h',
      direction: 271,
      battery: 100,
      gpsDate: '2019-10-12 01:37:20',
      mileage: '31.91 km',
      stopTime: '',
      lat: -6.29244,
      long: 106.80162
  ),
  GpsModel(
      speed: '51.93 Km/h',
      direction: 271,
      battery: 100,
      gpsDate: '2019-10-12 01:37:40',
      mileage: '32.2 km',
      stopTime: '',
      lat: -6.292395,
      long: 106.79901
  ),
  GpsModel(
      speed: '46.96 Km/h',
      direction: 270,
      battery: 100,
      gpsDate: '2019-10-12 01:38:00',
      mileage: '32.46 km',
      stopTime: '',
      lat: -6.29235,
      long: 106.79665
  ),
  GpsModel(
      speed: '53.33 Km/h',
      direction: 270,
      battery: 100,
      gpsDate: '2019-10-12 01:38:20',
      mileage: '32.75 km',
      stopTime: '',
      lat: -6.2922935,
      long: 106.79397
  ),
  GpsModel(
      speed: '52.98 Km/h',
      direction: 269,
      battery: 100,
      gpsDate: '2019-10-12 01:38:39',
      mileage: '33.03 km',
      stopTime: '',
      lat: -6.2922735,
      long: 106.79144
  ),
  GpsModel(
      speed: '46.77 Km/h',
      direction: 270,
      battery: 100,
      gpsDate: '2019-10-12 01:38:59',
      mileage: '33.29 km',
      stopTime: '',
      lat: -6.2923317,
      long: 106.78909
  ),
  GpsModel(
      speed: '34.62 Km/h',
      direction: 272,
      battery: 100,
      gpsDate: '2019-10-12 01:39:19',
      mileage: '33.49 km',
      stopTime: '',
      lat: -6.292333,
      long: 106.78735
  ),
  GpsModel(
      speed: '46.64 Km/h',
      direction: 286,
      battery: 100,
      gpsDate: '2019-10-12 01:39:39',
      mileage: '33.74 km',
      stopTime: '',
      lat: -6.2919717,
      long: 106.785034
  ),
  GpsModel(
      speed: '47.18 Km/h',
      direction: 287,
      battery: 100,
      gpsDate: '2019-10-12 01:39:42',
      mileage: '33.78 km',
      stopTime: '',
      lat: -6.2918816,
      long: 106.78469
  ),
  GpsModel(
      speed: '50.4 Km/h',
      direction: 284,
      battery: 100,
      gpsDate: '2019-10-12 01:39:59',
      mileage: '34.02 km',
      stopTime: '',
      lat: -6.2912917,
      long: 106.78262
  ),
  GpsModel(
      speed: '46.48 Km/h',
      direction: 299,
      battery: 100,
      gpsDate: '2019-10-12 01:40:19',
      mileage: '34.28 km',
      stopTime: '',
      lat: -6.29051,
      long: 106.78042
  ),
  GpsModel(
      speed: '37.08 Km/h',
      direction: 311,
      battery: 100,
      gpsDate: '2019-10-12 01:40:39',
      mileage: '34.49 km',
      stopTime: '',
      lat: -6.289505,
      long: 106.778854
  ),
  GpsModel(
      speed: '6.8 Km/h',
      direction: 353,
      battery: 100,
      gpsDate: '2019-10-12 01:41:58',
      mileage: '34.64 km',
      stopTime: '',
      lat: -6.2885265,
      long: 106.77793
  ),
  GpsModel(
      speed: '32.23 Km/h',
      direction: 54,
      battery: 100,
      gpsDate: '2019-10-12 01:42:18',
      mileage: '34.81 km',
      stopTime: '',
      lat: -6.2874784,
      long: 106.77916
  ),
  GpsModel(
      speed: '40.33 Km/h',
      direction: 357,
      battery: 100,
      gpsDate: '2019-10-12 01:42:38',
      mileage: '35.04 km',
      stopTime: '',
      lat: -6.2857733,
      long: 106.78024
  ),
  GpsModel(
      speed: '34.68 Km/h',
      direction: 357,
      battery: 100,
      gpsDate: '2019-10-12 01:42:58',
      mileage: '35.23 km',
      stopTime: '',
      lat: -6.284042,
      long: 106.780174
  ),
  GpsModel(
      speed: '38 Km/h',
      direction: 7,
      battery: 100,
      gpsDate: '2019-10-12 01:43:17',
      mileage: '35.43 km',
      stopTime: '',
      lat: -6.2822385,
      long: 106.7802
  ),
  GpsModel(
      speed: '25.95 Km/h',
      direction: 14,
      battery: 100,
      gpsDate: '2019-10-12 01:43:37',
      mileage: '35.58 km',
      stopTime: '',
      lat: -6.280968,
      long: 106.78046
  ),
  GpsModel(
      speed: '17.49 Km/h',
      direction: 20,
      battery: 100,
      gpsDate: '2019-10-12 01:43:57',
      mileage: '35.67 km',
      stopTime: '',
      lat: -6.2800965,
      long: 106.780525
  ),
  GpsModel(
      speed: '2.1 Km/h',
      direction: 108,
      battery: 100,
      gpsDate: '2019-10-12 01:44:40',
      mileage: '35.7 km',
      stopTime: '',
      lat: -6.28,
      long: 106.78073
  ),
  GpsModel(
      speed: '6.94 Km/h',
      direction: 132,
      battery: 100,
      gpsDate: '2019-10-12 01:45:17',
      mileage: '35.77 km',
      stopTime: '',
      lat: -6.280393,
      long: 106.78124
  ),
  GpsModel(
      speed: '44.04 Km/h',
      direction: 107,
      battery: 100,
      gpsDate: '2019-10-12 01:45:36',
      mileage: '36 km',
      stopTime: '',
      lat: -6.2810683,
      long: 106.78323
  ),
  GpsModel(
      speed: '34.17 Km/h',
      direction: 138,
      battery: 100,
      gpsDate: '2019-10-12 01:45:56',
      mileage: '36.19 km',
      stopTime: '',
      lat: -6.281783,
      long: 106.78479
  ),
  GpsModel(
      speed: '45.01 Km/h',
      direction: 148,
      battery: 100,
      gpsDate: '2019-10-12 01:46:16',
      mileage: '36.44 km',
      stopTime: '',
      lat: -6.283408,
      long: 106.786354
  ),
  GpsModel(
      speed: '25.8 Km/h',
      direction: 82,
      battery: 100,
      gpsDate: '2019-10-12 01:46:36',
      mileage: '36.58 km',
      stopTime: '',
      lat: -6.284245,
      long: 106.78734
  ),
  GpsModel(
      speed: '19.62 Km/h',
      direction: 28,
      battery: 100,
      gpsDate: '2019-10-12 01:46:56',
      mileage: '36.69 km',
      stopTime: '',
      lat: -6.2834315,
      long: 106.78789
  ),
  GpsModel(
      speed: '15.74 Km/h',
      direction: 35,
      battery: 100,
      gpsDate: '2019-10-12 01:47:16',
      mileage: '36.78 km',
      stopTime: '',
      lat: -6.2827716,
      long: 106.78832
  ),
  GpsModel(
      speed: '6.97 Km/h',
      direction: 49,
      battery: 100,
      gpsDate: '2019-10-12 01:47:36',
      mileage: '36.82 km',
      stopTime: '',
      lat: -6.282688,
      long: 106.78866
  ),
  GpsModel(
      speed: '15.18 Km/h',
      direction: 8,
      battery: 100,
      gpsDate: '2019-10-12 01:47:55',
      mileage: '36.9 km',
      stopTime: '',
      lat: -6.2820415,
      long: 106.78898
  ),
  GpsModel(
      speed: '0.83 Km/h',
      direction: 331,
      battery: 100,
      gpsDate: '2019-10-12 01:49:38',
      mileage: '36.92 km',
      stopTime: '',
      lat: -6.2818565,
      long: 106.789085
  ),
  GpsModel(
      speed: '0.01 Km/h',
      direction: 331,
      battery: 100,
      gpsDate: '2019-10-12 01:54:36',
      mileage: '36.92 km',
      stopTime: '3 jam 13 menit',
      lat: -6.281852,
      long: 106.78909
  ),
  GpsModel(
      speed: '0.01 Km/h',
      direction: 179,
      battery: 100,
      gpsDate: '2019-10-12 05:07:44',
      mileage: '36.95 km',
      stopTime: '',
      lat: -6.2820983,
      long: 106.789
  ),
  GpsModel(
      speed: '14.48 Km/h',
      direction: 210,
      battery: 100,
      gpsDate: '2019-10-12 05:08:04',
      mileage: '37.03 km',
      stopTime: '',
      lat: -6.282748,
      long: 106.78868
  ),
  GpsModel(
      speed: '17.18 Km/h',
      direction: 216,
      battery: 100,
      gpsDate: '2019-10-12 05:08:24',
      mileage: '37.13 km',
      stopTime: '',
      lat: -6.28334,
      long: 106.788055
  ),
  GpsModel(
      speed: '15.54 Km/h',
      direction: 204,
      battery: 100,
      gpsDate: '2019-10-12 05:08:34',
      mileage: '37.17 km',
      stopTime: '',
      lat: -6.28366,
      long: 106.787834
  ),
  GpsModel(
      speed: '12.49 Km/h',
      direction: 211,
      battery: 100,
      gpsDate: '2019-10-12 05:08:44',
      mileage: '37.21 km',
      stopTime: '',
      lat: -6.2839284,
      long: 106.787674
  ),
  GpsModel(
      speed: '8.94 Km/h',
      direction: 209,
      battery: 100,
      gpsDate: '2019-10-12 05:09:04',
      mileage: '37.26 km',
      stopTime: '',
      lat: -6.284313,
      long: 106.787445
  ),
  GpsModel(
      speed: '21.93 Km/h',
      direction: 330,
      battery: 100,
      gpsDate: '2019-10-12 05:09:23',
      mileage: '37.37 km',
      stopTime: '',
      lat: -6.2837334,
      long: 106.786575
  ),
  GpsModel(
      speed: '33.42 Km/h',
      direction: 309,
      battery: 100,
      gpsDate: '2019-10-12 05:09:43',
      mileage: '37.56 km',
      stopTime: '',
      lat: -6.2824383,
      long: 106.785515
  ),
  GpsModel(
      speed: '32.31 Km/h',
      direction: 286,
      battery: 100,
      gpsDate: '2019-10-12 05:10:03',
      mileage: '37.74 km',
      stopTime: '',
      lat: -6.281505,
      long: 106.78419
  ),
  GpsModel(
      speed: '33.71 Km/h',
      direction: 283,
      battery: 100,
      gpsDate: '2019-10-12 05:10:23',
      mileage: '37.93 km',
      stopTime: '',
      lat: -6.280872,
      long: 106.78262
  ),
  GpsModel(
      speed: '15.64 Km/h',
      direction: 286,
      battery: 100,
      gpsDate: '2019-10-12 05:10:43',
      mileage: '38.01 km',
      stopTime: '',
      lat: -6.280638,
      long: 106.78187
  ),
  GpsModel(
      speed: '2.69 Km/h',
      direction: 239,
      battery: 100,
      gpsDate: '2019-10-12 05:13:02',
      mileage: '38.12 km',
      stopTime: '',
      lat: -6.280452,
      long: 106.78095
  ),
  GpsModel(
      speed: '14.95 Km/h',
      direction: 43,
      battery: 100,
      gpsDate: '2019-10-12 05:13:22',
      mileage: '38.2 km',
      stopTime: '',
      lat: -6.2797117,
      long: 106.78085
  ),
  GpsModel(
      speed: '38.91 Km/h',
      direction: 17,
      battery: 100,
      gpsDate: '2019-10-12 05:13:32',
      mileage: '38.31 km',
      stopTime: '',
      lat: -6.278792,
      long: 106.781166
  ),
  GpsModel(
      speed: '51.95 Km/h',
      direction: 13,
      battery: 100,
      gpsDate: '2019-10-12 05:13:42',
      mileage: '38.45 km',
      stopTime: '',
      lat: -6.27754,
      long: 106.78151
  ),
  GpsModel(
      speed: '24.77 Km/h',
      direction: 20,
      battery: 100,
      gpsDate: '2019-10-12 05:15:41',
      mileage: '39.27 km',
      stopTime: '',
      lat: -6.270425,
      long: 106.783424
  ),
  GpsModel(
      speed: '11.05 Km/h',
      direction: 10,
      battery: 100,
      gpsDate: '2019-10-12 05:16:01',
      mileage: '39.33 km',
      stopTime: '',
      lat: -6.2698884,
      long: 106.783554
  ),
  GpsModel(
      speed: '9.96 Km/h',
      direction: 1,
      battery: 100,
      gpsDate: '2019-10-12 05:16:20',
      mileage: '39.38 km',
      stopTime: '',
      lat: -6.269417,
      long: 106.78359
  ),
  GpsModel(
      speed: '7.27 Km/h',
      direction: 355,
      battery: 100,
      gpsDate: '2019-10-12 05:17:00',
      mileage: '39.46 km',
      stopTime: '',
      lat: -6.2686915,
      long: 106.783554
  ),
  GpsModel(
      speed: '5.41 Km/h',
      direction: 359,
      battery: 100,
      gpsDate: '2019-10-12 05:17:20',
      mileage: '39.49 km',
      stopTime: '',
      lat: -6.2684216,
      long: 106.78354
  ),
  GpsModel(
      speed: '8.81 Km/h',
      direction: 2,
      battery: 100,
      gpsDate: '2019-10-12 05:17:40',
      mileage: '39.54 km',
      stopTime: '',
      lat: -6.2679815,
      long: 106.78354
  ),
  GpsModel(
      speed: '8.39 Km/h',
      direction: 265,
      battery: 100,
      gpsDate: '2019-10-12 05:18:00',
      mileage: '39.59 km',
      stopTime: '',
      lat: -6.267618,
      long: 106.78333
  ),
  GpsModel(
      speed: '4.82 Km/h',
      direction: 13,
      battery: 100,
      gpsDate: '2019-10-12 05:18:39',
      mileage: '39.64 km',
      stopTime: '',
      lat: -6.2672467,
      long: 106.78304
  ),
  GpsModel(
      speed: '5.23 Km/h',
      direction: 1,
      battery: 100,
      gpsDate: '2019-10-12 05:18:59',
      mileage: '39.67 km',
      stopTime: '',
      lat: -6.266987,
      long: 106.78307
  ),
  GpsModel(
      speed: '8.55 Km/h',
      direction: 353,
      battery: 100,
      gpsDate: '2019-10-12 05:19:19',
      mileage: '39.72 km',
      stopTime: '',
      lat: -6.26662,
      long: 106.78329
  ),
  GpsModel(
      speed: '6.22 Km/h',
      direction: 4,
      battery: 100,
      gpsDate: '2019-10-12 05:19:39',
      mileage: '39.75 km',
      stopTime: '',
      lat: -6.2663116,
      long: 106.78325
  ),
  GpsModel(
      speed: '16.16 Km/h',
      direction: 337,
      battery: 100,
      gpsDate: '2019-10-12 05:19:59',
      mileage: '39.84 km',
      stopTime: '',
      lat: -6.2655115,
      long: 106.78314
  ),
  GpsModel(
      speed: '9.66 Km/h',
      direction: 330,
      battery: 100,
      gpsDate: '2019-10-12 05:20:19',
      mileage: '39.9 km',
      stopTime: '2 jam 23 menit',
      lat: -6.265128,
      long: 106.782845
  ),
  GpsModel(
      speed: '0.09 Km/h',
      direction: 170,
      battery: 100,
      gpsDate: '2019-10-12 07:43:26',
      mileage: '40.11 km',
      stopTime: '',
      lat: -6.2670665,
      long: 106.783
  ),
  GpsModel(
      speed: '5.86 Km/h',
      direction: 187,
      battery: 100,
      gpsDate: '2019-10-12 07:43:46',
      mileage: '40.15 km',
      stopTime: '',
      lat: -6.267355,
      long: 106.78295
  ),
  GpsModel(
      speed: '1.08 Km/h',
      direction: 99,
      battery: 100,
      gpsDate: '2019-10-12 07:45:45',
      mileage: '40.18 km',
      stopTime: '',
      lat: -6.267637,
      long: 106.783104
  ),
  GpsModel(
      speed: '7.82 Km/h',
      direction: 0,
      battery: 100,
      gpsDate: '2019-10-12 07:46:05',
      mileage: '40.23 km',
      stopTime: '',
      lat: -6.2675633,
      long: 106.78349
  ),
  GpsModel(
      speed: '20.43 Km/h',
      direction: 0,
      battery: 100,
      gpsDate: '2019-10-12 07:46:25',
      mileage: '40.34 km',
      stopTime: '',
      lat: -6.2665467,
      long: 106.78358
  ),
  GpsModel(
      speed: '4.11 Km/h',
      direction: 359,
      battery: 100,
      gpsDate: '2019-10-12 07:47:24',
      mileage: '40.41 km',
      stopTime: '',
      lat: -6.2659435,
      long: 106.78352
  ),
  GpsModel(
      speed: '12.41 Km/h',
      direction: 356,
      battery: 100,
      gpsDate: '2019-10-12 07:47:36',
      mileage: '40.45 km',
      stopTime: '',
      lat: -6.265577,
      long: 106.783455
  ),
  GpsModel(
      speed: '2.99 Km/h',
      direction: 358,
      battery: 100,
      gpsDate: '2019-10-12 07:48:24',
      mileage: '40.49 km',
      stopTime: '',
      lat: -6.26522,
      long: 106.78342
  ),
  GpsModel(
      speed: '2.39 Km/h',
      direction: 1,
      battery: 100,
      gpsDate: '2019-10-12 07:49:23',
      mileage: '40.53 km',
      stopTime: '',
      lat: -6.2648735,
      long: 106.783356
  ),
  GpsModel(
      speed: '15.61 Km/h',
      direction: 3,
      battery: 100,
      gpsDate: '2019-10-12 07:49:43',
      mileage: '40.61 km',
      stopTime: '',
      lat: -6.2640934,
      long: 106.78336
  ),
  GpsModel(
      speed: '31.49 Km/h',
      direction: 67,
      battery: 100,
      gpsDate: '2019-10-12 07:50:03',
      mileage: '40.79 km',
      stopTime: '',
      lat: -6.2631683,
      long: 106.78464
  ),
  GpsModel(
      speed: '32.41 Km/h',
      direction: 103,
      battery: 100,
      gpsDate: '2019-10-12 07:50:23',
      mileage: '40.97 km',
      stopTime: '',
      lat: -6.263,
      long: 106.78626
  ),
  GpsModel(
      speed: '31.24 Km/h',
      direction: 103,
      battery: 100,
      gpsDate: '2019-10-12 07:50:43',
      mileage: '41.14 km',
      stopTime: '',
      lat: -6.26335,
      long: 106.78779
  ),
  GpsModel(
      speed: '10.75 Km/h',
      direction: 210,
      battery: 100,
      gpsDate: '2019-10-12 07:51:03',
      mileage: '41.2 km',
      stopTime: '',
      lat: -6.2635765,
      long: 106.78828
  ),
  GpsModel(
      speed: '3.11 Km/h',
      direction: 164,
      battery: 100,
      gpsDate: '2019-10-12 07:51:23',
      mileage: '41.22 km',
      stopTime: '',
      lat: -6.2637315,
      long: 106.78829
  ),
  GpsModel(
      speed: '2.68 Km/h',
      direction: 133,
      battery: 100,
      gpsDate: '2019-10-12 07:51:42',
      mileage: '41.23 km',
      stopTime: '2 jam 15 menit',
      lat: -6.2636666,
      long: 106.7884
  ),
  GpsModel(
      speed: '0.01 Km/h',
      direction: 25,
      battery: 100,
      gpsDate: '2019-10-12 10:05:26',
      mileage: '41.24 km',
      stopTime: '',
      lat: -6.2637467,
      long: 106.78833
  ),
  GpsModel(
      speed: '4.94 Km/h',
      direction: 104,
      battery: 100,
      gpsDate: '2019-10-12 10:06:25',
      mileage: '41.33 km',
      stopTime: '',
      lat: -6.263692,
      long: 106.78906
  ),
  GpsModel(
      speed: '24.97 Km/h',
      direction: 91,
      battery: 100,
      gpsDate: '2019-10-12 10:06:45',
      mileage: '41.46 km',
      stopTime: '',
      lat: -6.263885,
      long: 106.7903
  ),
  GpsModel(
      speed: '22.89 Km/h',
      direction: 96,
      battery: 100,
      gpsDate: '2019-10-12 10:07:05',
      mileage: '41.59 km',
      stopTime: '',
      lat: -6.26392,
      long: 106.79145
  ),
  GpsModel(
      speed: '20.25 Km/h',
      direction: 128,
      battery: 100,
      gpsDate: '2019-10-12 10:07:25',
      mileage: '41.7 km',
      stopTime: '',
      lat: -6.2640433,
      long: 106.79246
  ),
  GpsModel(
      speed: '14.47 Km/h',
      direction: 103,
      battery: 100,
      gpsDate: '2019-10-12 10:07:45',
      mileage: '41.78 km',
      stopTime: '',
      lat: -6.264147,
      long: 106.79318
  ),
  GpsModel(
      speed: '19.29 Km/h',
      direction: 101,
      battery: 100,
      gpsDate: '2019-10-12 10:08:05',
      mileage: '41.89 km',
      stopTime: '',
      lat: -6.2643065,
      long: 106.794136
  ),
  GpsModel(
      speed: '13.84 Km/h',
      direction: 10,
      battery: 100,
      gpsDate: '2019-10-12 10:08:24',
      mileage: '41.96 km',
      stopTime: '',
      lat: -6.263692,
      long: 106.79437
  ),
  GpsModel(
      speed: '14.36 Km/h',
      direction: 106,
      battery: 100,
      gpsDate: '2019-10-12 10:08:44',
      mileage: '42.04 km',
      stopTime: '',
      lat: -6.26374,
      long: 106.79509
  ),
  GpsModel(
      speed: '2.6 Km/h',
      direction: 115,
      battery: 100,
      gpsDate: '2019-10-12 10:09:53',
      mileage: '42.09 km',
      stopTime: '',
      lat: -6.263857,
      long: 106.795525
  ),
  GpsModel(
      speed: '4.43 Km/h',
      direction: 103,
      battery: 100,
      gpsDate: '2019-10-12 10:11:03',
      mileage: '42.18 km',
      stopTime: '',
      lat: -6.26394,
      long: 106.7963
  ),
  GpsModel(
      speed: '1.43 Km/h',
      direction: 82,
      battery: 100,
      gpsDate: '2019-10-12 10:13:22',
      mileage: '42.24 km',
      stopTime: '',
      lat: -6.2639217,
      long: 106.7968
  ),
  GpsModel(
      speed: '0.69 Km/h',
      direction: 55,
      battery: 100,
      gpsDate: '2019-10-12 10:14:51',
      mileage: '42.25 km',
      stopTime: '',
      lat: -6.263883,
      long: 106.79695
  ),
  GpsModel(
      speed: '0.64 Km/h',
      direction: 81,
      battery: 100,
      gpsDate: '2019-10-12 10:16:01',
      mileage: '42.27 km',
      stopTime: '',
      lat: -6.263857,
      long: 106.79706
  ),
  GpsModel(
      speed: '22.1 Km/h',
      direction: 334,
      battery: 100,
      gpsDate: '2019-10-12 10:16:21',
      mileage: '42.39 km',
      stopTime: '',
      lat: -6.262797,
      long: 106.79675
  ),
  GpsModel(
      speed: '28.33 Km/h',
      direction: 358,
      battery: 100,
      gpsDate: '2019-10-12 10:16:41',
      mileage: '42.55 km',
      stopTime: '',
      lat: -6.2614,
      long: 106.79652
  ),
  GpsModel(
      speed: '14.99 Km/h',
      direction: 4,
      battery: 100,
      gpsDate: '2019-10-12 10:17:01',
      mileage: '42.63 km',
      stopTime: '',
      lat: -6.2606516,
      long: 106.79655
  ),
  GpsModel(
      speed: '12.89 Km/h',
      direction: 0,
      battery: 100,
      gpsDate: '2019-10-12 10:17:21',
      mileage: '42.7 km',
      stopTime: '',
      lat: -6.2600083,
      long: 106.79658
  ),
  GpsModel(
      speed: '28.98 Km/h',
      direction: 6,
      battery: 100,
      gpsDate: '2019-10-12 10:17:41',
      mileage: '42.86 km',
      stopTime: '',
      lat: -6.258567,
      long: 106.79672
  ),
  GpsModel(
      speed: '20.05 Km/h',
      direction: 5,
      battery: 100,
      gpsDate: '2019-10-12 10:18:20',
      mileage: '43.08 km',
      stopTime: '',
      lat: -6.2566266,
      long: 106.79695
  ),
  GpsModel(
      speed: '19.67 Km/h',
      direction: 6,
      battery: 100,
      gpsDate: '2019-10-12 10:18:40',
      mileage: '43.19 km',
      stopTime: '',
      lat: -6.2556567,
      long: 106.79711
  ),
  GpsModel(
      speed: '8.17 Km/h',
      direction: 1,
      battery: 100,
      gpsDate: '2019-10-12 10:19:00',
      mileage: '43.23 km',
      stopTime: '',
      lat: -6.2552633,
      long: 106.79722
  ),
  GpsModel(
      speed: '19.86 Km/h',
      direction: 90,
      battery: 100,
      gpsDate: '2019-10-12 10:19:20',
      mileage: '43.34 km',
      stopTime: '',
      lat: -6.254958,
      long: 106.79817
  ),
  GpsModel(
      speed: '35.13 Km/h',
      direction: 87,
      battery: 100,
      gpsDate: '2019-10-12 10:19:40',
      mileage: '43.54 km',
      stopTime: '',
      lat: -6.2548184,
      long: 106.79993
  ),
  GpsModel(
      speed: '34.33 Km/h',
      direction: 87,
      battery: 100,
      gpsDate: '2019-10-12 10:19:49',
      mileage: '43.62 km',
      stopTime: '',
      lat: -6.2547717,
      long: 106.800705
  ),
  GpsModel(
      speed: '11.62 Km/h',
      direction: 163,
      battery: 100,
      gpsDate: '2019-10-12 10:20:19',
      mileage: '43.72 km',
      stopTime: '',
      lat: -6.2548733,
      long: 106.801575
  ),
  GpsModel(
      speed: '1.41 Km/h',
      direction: 112,
      battery: 100,
      gpsDate: '2019-10-12 10:20:59',
      mileage: '43.74 km',
      stopTime: '',
      lat: -6.2547917,
      long: 106.80169
  ),
  GpsModel(
      speed: '2.53 Km/h',
      direction: 112,
      battery: 100,
      gpsDate: '2019-10-12 10:21:19',
      mileage: '43.75 km',
      stopTime: '',
      lat: -6.2546935,
      long: 106.80177
  ),
  GpsModel(
      speed: '24.2 Km/h',
      direction: 88,
      battery: 100,
      gpsDate: '2019-10-12 10:21:39',
      mileage: '43.89 km',
      stopTime: '',
      lat: -6.2546635,
      long: 106.802986
  ),
  GpsModel(
      speed: '18.83 Km/h',
      direction: 349,
      battery: 100,
      gpsDate: '2019-10-12 10:21:59',
      mileage: '43.99 km',
      stopTime: '',
      lat: -6.2543983,
      long: 106.803894
  ),
  GpsModel(
      speed: '11.73 Km/h',
      direction: 122,
      battery: 100,
      gpsDate: '2019-10-12 10:22:19',
      mileage: '44.06 km',
      stopTime: '',
      lat: -6.254235,
      long: 106.80446
  ),
  GpsModel(
      speed: '16.33 Km/h',
      direction: 4,
      battery: 100,
      gpsDate: '2019-10-12 10:22:38',
      mileage: '44.14 km',
      stopTime: '',
      lat: -6.2540617,
      long: 106.80522
  ),
  GpsModel(
      speed: '31.91 Km/h',
      direction: 24,
      battery: 100,
      gpsDate: '2019-10-12 10:22:58',
      mileage: '44.32 km',
      stopTime: '',
      lat: -6.2526135,
      long: 106.80589
  ),
  GpsModel(
      speed: '32.53 Km/h',
      direction: 26,
      battery: 100,
      gpsDate: '2019-10-12 10:23:18',
      mileage: '44.5 km',
      stopTime: '',
      lat: -6.251147,
      long: 106.806595
  ),
  GpsModel(
      speed: '34.63 Km/h',
      direction: 52,
      battery: 100,
      gpsDate: '2019-10-12 10:23:38',
      mileage: '44.69 km',
      stopTime: '',
      lat: -6.2499084,
      long: 106.80781
  ),
  GpsModel(
      speed: '13.15 Km/h',
      direction: 84,
      battery: 100,
      gpsDate: '2019-10-12 10:23:58',
      mileage: '44.76 km',
      stopTime: '',
      lat: -6.249457,
      long: 106.80829
  ),
  GpsModel(
      speed: '28.19 Km/h',
      direction: 114,
      battery: 100,
      gpsDate: '2019-10-12 10:24:18',
      mileage: '44.92 km',
      stopTime: '',
      lat: -6.2500267,
      long: 106.809586
  ),
  GpsModel(
      speed: '27.1 Km/h',
      direction: 222,
      battery: 100,
      gpsDate: '2019-10-12 10:24:38',
      mileage: '45.07 km',
      stopTime: '',
      lat: -6.251362,
      long: 106.80936
  ),
  GpsModel(
      speed: '41.49 Km/h',
      direction: 219,
      battery: 100,
      gpsDate: '2019-10-12 10:24:46',
      mileage: '45.16 km',
      stopTime: '',
      lat: -6.25204,
      long: 106.80888
  ),
  GpsModel(
      speed: '20.84 Km/h',
      direction: 193,
      battery: 100,
      gpsDate: '2019-10-12 10:24:57',
      mileage: '45.23 km',
      stopTime: '',
      lat: -6.252565,
      long: 106.80865
  ),
  GpsModel(
      speed: '19.08 Km/h',
      direction: 191,
      battery: 100,
      gpsDate: '2019-10-12 10:25:17',
      mileage: '45.33 km',
      stopTime: '',
      lat: -6.2534485,
      long: 106.80829
  ),
  GpsModel(
      speed: '15.55 Km/h',
      direction: 175,
      battery: 100,
      gpsDate: '2019-10-12 10:25:37',
      mileage: '45.42 km',
      stopTime: '',
      lat: -6.2542214,
      long: 106.80821
  ),
  GpsModel(
      speed: '2.87 Km/h',
      direction: 84,
      battery: 100,
      gpsDate: '2019-10-12 10:27:36',
      mileage: '45.52 km',
      stopTime: '',
      lat: -6.2550035,
      long: 106.80855
  ),
  GpsModel(
      speed: '26.62 Km/h',
      direction: 93,
      battery: 100,
      gpsDate: '2019-10-12 10:27:56',
      mileage: '45.66 km',
      stopTime: '',
      lat: -6.2551465,
      long: 106.80988
  ),
  GpsModel(
      speed: '18.71 Km/h',
      direction: 89,
      battery: 100,
      gpsDate: '2019-10-12 10:28:16',
      mileage: '45.77 km',
      stopTime: '',
      lat: -6.2551765,
      long: 106.81082
  ),
  GpsModel(
      speed: '18.95 Km/h',
      direction: 135,
      battery: 100,
      gpsDate: '2019-10-12 10:28:36',
      mileage: '45.87 km',
      stopTime: '',
      lat: -6.2554564,
      long: 106.81173
  ),
  GpsModel(
      speed: '7.97 Km/h',
      direction: 92,
      battery: 100,
      gpsDate: '2019-10-12 10:28:56',
      mileage: '45.92 km',
      stopTime: '',
      lat: -6.2556314,
      long: 106.81209
  ),
  GpsModel(
      speed: '5.28 Km/h',
      direction: 88,
      battery: 100,
      gpsDate: '2019-10-12 10:29:16',
      mileage: '45.95 km',
      stopTime: '',
      lat: -6.255622,
      long: 106.812355
  ),
  GpsModel(
      speed: '12.59 Km/h',
      direction: 73,
      battery: 100,
      gpsDate: '2019-10-12 10:29:35',
      mileage: '46.01 km',
      stopTime: '',
      lat: -6.255535,
      long: 106.81295
  ),
  GpsModel(
      speed: '21.33 Km/h',
      direction: 86,
      battery: 100,
      gpsDate: '2019-10-12 10:29:44',
      mileage: '46.07 km',
      stopTime: '',
      lat: -6.2554865,
      long: 106.81343
  ),
  GpsModel(
      speed: '22.85 Km/h',
      direction: 84,
      battery: 100,
      gpsDate: '2019-10-12 10:29:55',
      mileage: '46.14 km',
      stopTime: '',
      lat: -6.2554398,
      long: 106.81406
  ),
  GpsModel(
      speed: '3.88 Km/h',
      direction: 119,
      battery: 100,
      gpsDate: '2019-10-12 10:30:55',
      mileage: '46.2 km',
      stopTime: '',
      lat: -6.2554717,
      long: 106.814644
  ),
  GpsModel(
      speed: '1.03 Km/h',
      direction: 175,
      battery: 100,
      gpsDate: '2019-10-12 10:32:54',
      mileage: '46.23 km',
      stopTime: '',
      lat: -6.25577,
      long: 106.81471
  ),
  GpsModel(
      speed: '4.66 Km/h',
      direction: 171,
      battery: 100,
      gpsDate: '2019-10-12 10:33:14',
      mileage: '46.26 km',
      stopTime: '',
      lat: -6.255995,
      long: 106.81477
  ),
  GpsModel(
      speed: '4.06 Km/h',
      direction: 173,
      battery: 100,
      gpsDate: '2019-10-12 10:33:34',
      mileage: '46.28 km',
      stopTime: '',
      lat: -6.256195,
      long: 106.814804
  ),
  GpsModel(
      speed: '4.81 Km/h',
      direction: 177,
      battery: 100,
      gpsDate: '2019-10-12 10:33:54',
      mileage: '46.31 km',
      stopTime: '',
      lat: -6.2564335,
      long: 106.814835
  ),
  GpsModel(
      speed: '1.16 Km/h',
      direction: 176,
      battery: 100,
      gpsDate: '2019-10-12 10:34:42',
      mileage: '46.32 km',
      stopTime: '',
      lat: -6.256573,
      long: 106.81483
  ),
  GpsModel(
      speed: '5.54 Km/h',
      direction: 274,
      battery: 100,
      gpsDate: '2019-10-12 10:34:53',
      mileage: '46.34 km',
      stopTime: '',
      lat: -6.256635,
      long: 106.81469
  ),
  GpsModel(
      speed: '0.09 Km/h',
      direction: 295,
      battery: 100,
      gpsDate: '2019-10-12 10:39:40',
      mileage: '46.35 km',
      stopTime: '44 menit',
      lat: -6.2567015,
      long: 106.81468
  ),
  GpsModel(
      speed: '0.08 Km/h',
      direction: 180,
      battery: 100,
      gpsDate: '2019-10-12 11:24:22',
      mileage: '46.41 km',
      stopTime: '',
      lat: -6.2571735,
      long: 106.814896
  ),
  GpsModel(
      speed: '2 Km/h',
      direction: 183,
      battery: 100,
      gpsDate: '2019-10-12 11:24:40',
      mileage: '46.42 km',
      stopTime: '',
      lat: -6.2572618,
      long: 106.81488
  ),
  GpsModel(
      speed: '0.28 Km/h',
      direction: 184,
      battery: 100,
      gpsDate: '2019-10-12 11:26:19',
      mileage: '46.42 km',
      stopTime: '',
      lat: -6.2572985,
      long: 106.81494
  ),
  GpsModel(
      speed: '1.16 Km/h',
      direction: 244,
      battery: 100,
      gpsDate: '2019-10-12 11:29:37',
      mileage: '46.49 km',
      stopTime: '',
      lat: -6.257682,
      long: 106.81451
  ),
  GpsModel(
      speed: '8.62 Km/h',
      direction: 250,
      battery: 100,
      gpsDate: '2019-10-12 11:29:57',
      mileage: '46.54 km',
      stopTime: '',
      lat: -6.257847,
      long: 106.81411
  ),
  GpsModel(
      speed: '8.68 Km/h',
      direction: 246,
      battery: 100,
      gpsDate: '2019-10-12 11:30:17',
      mileage: '46.58 km',
      stopTime: '',
      lat: -6.25802,
      long: 106.81371
  ),
  GpsModel(
      speed: '5.89 Km/h',
      direction: 356,
      battery: 100,
      gpsDate: '2019-10-12 11:30:37',
      mileage: '46.62 km',
      stopTime: '',
      lat: -6.2579618,
      long: 106.81342
  ),
  GpsModel(
      speed: '8.15 Km/h',
      direction: 352,
      battery: 100,
      gpsDate: '2019-10-12 11:30:57',
      mileage: '46.66 km',
      stopTime: '',
      lat: -6.25756,
      long: 106.813354
  ),
  GpsModel(
      speed: '13.83 Km/h',
      direction: 355,
      battery: 100,
      gpsDate: '2019-10-12 11:31:17',
      mileage: '46.74 km',
      stopTime: '',
      lat: -6.256873,
      long: 106.81328
  ),
  GpsModel(
      speed: '6.14 Km/h',
      direction: 263,
      battery: 100,
      gpsDate: '2019-10-12 11:31:37',
      mileage: '46.77 km',
      stopTime: '',
      lat: -6.256708,
      long: 106.81302
  ),
  GpsModel(
      speed: '3.14 Km/h',
      direction: 10,
      battery: 100,
      gpsDate: '2019-10-12 11:32:36',
      mileage: '46.82 km',
      stopTime: '',
      lat: -6.2563915,
      long: 106.81268
  ),
  GpsModel(
      speed: '9.48 Km/h',
      direction: 0,
      battery: 100,
      gpsDate: '2019-10-12 11:32:56',
      mileage: '46.88 km',
      stopTime: '',
      lat: -6.2559185,
      long: 106.81266
  ),
  GpsModel(
      speed: '6.67 Km/h',
      direction: 259,
      battery: 100,
      gpsDate: '2019-10-12 11:33:16',
      mileage: '46.91 km',
      stopTime: '',
      lat: -6.2557516,
      long: 106.81237
  ),
  GpsModel(
      speed: '3.58 Km/h',
      direction: 292,
      battery: 100,
      gpsDate: '2019-10-12 11:34:28',
      mileage: '46.99 km',
      stopTime: '',
      lat: -6.2555985,
      long: 106.81174
  ),
  GpsModel(
      speed: '0.01 Km/h',
      direction: 292,
      battery: 100,
      gpsDate: '2019-10-12 11:39:26',
      mileage: '46.99 km',
      stopTime: '50 menit',
      lat: -6.255592,
      long: 106.81174
  ),
  GpsModel(
      speed: '0.04 Km/h',
      direction: 279,
      battery: 100,
      gpsDate: '2019-10-12 12:29:26',
      mileage: '47.02 km',
      stopTime: '',
      lat: -6.2554216,
      long: 106.81146
  ),
  GpsModel(
      speed: '3.74 Km/h',
      direction: 268,
      battery: 100,
      gpsDate: '2019-10-12 12:30:06',
      mileage: '47.06 km',
      stopTime: '',
      lat: -6.255315,
      long: 106.8111
  ),
  GpsModel(
      speed: '6.4 Km/h',
      direction: 271,
      battery: 100,
      gpsDate: '2019-10-12 12:31:06',
      mileage: '47.17 km',
      stopTime: '',
      lat: -6.2552967,
      long: 106.810135
  ),
  GpsModel(
      speed: '8.49 Km/h',
      direction: 268,
      battery: 100,
      gpsDate: '2019-10-12 12:31:25',
      mileage: '47.22 km',
      stopTime: '',
      lat: -6.2552814,
      long: 106.80973
  ),
  GpsModel(
      speed: '13.73 Km/h',
      direction: 274,
      battery: 100,
      gpsDate: '2019-10-12 12:31:45',
      mileage: '47.29 km',
      stopTime: '',
      lat: -6.255272,
      long: 106.80904
  ),
  GpsModel(
      speed: '5.97 Km/h',
      direction: 268,
      battery: 100,
      gpsDate: '2019-10-12 12:32:05',
      mileage: '47.33 km',
      stopTime: '',
      lat: -6.2552586,
      long: 106.80874
  ),
  GpsModel(
      speed: '1.02 Km/h',
      direction: 281,
      battery: 100,
      gpsDate: '2019-10-12 12:33:44',
      mileage: '47.35 km',
      stopTime: '',
      lat: -6.25518,
      long: 106.8085
  ),
  GpsModel(
      speed: '21.8 Km/h',
      direction: 290,
      battery: 100,
      gpsDate: '2019-10-12 12:34:03',
      mileage: '47.47 km',
      stopTime: '',
      lat: -6.25486,
      long: 106.80751
  ),
  GpsModel(
      speed: '40.64 Km/h',
      direction: 290,
      battery: 100,
      gpsDate: '2019-10-12 12:34:04',
      mileage: '47.48 km',
      stopTime: '',
      lat: -6.254812,
      long: 106.80742
  ),
  GpsModel(
      speed: '18.43 Km/h',
      direction: 256,
      battery: 100,
      gpsDate: '2019-10-12 12:34:44',
      mileage: '47.68 km',
      stopTime: '',
      lat: -6.254707,
      long: 106.80557
  ),
  GpsModel(
      speed: '21.95 Km/h',
      direction: 266,
      battery: 100,
      gpsDate: '2019-10-12 12:35:04',
      mileage: '47.81 km',
      stopTime: '',
      lat: -6.25462,
      long: 106.80447
  ),
  GpsModel(
      speed: '13.33 Km/h',
      direction: 272,
      battery: 100,
      gpsDate: '2019-10-12 12:35:24',
      mileage: '47.88 km',
      stopTime: '',
      lat: -6.2546215,
      long: 106.8038
  ),
  GpsModel(
      speed: '23.93 Km/h',
      direction: 267,
      battery: 100,
      gpsDate: '2019-10-12 12:35:44',
      mileage: '48.01 km',
      stopTime: '',
      lat: -6.254705,
      long: 106.8026
  ),
  GpsModel(
      speed: '23.11 Km/h',
      direction: 300,
      battery: 100,
      gpsDate: '2019-10-12 12:36:03',
      mileage: '48.14 km',
      stopTime: '',
      lat: -6.2544365,
      long: 106.80153
  ),
  GpsModel(
      speed: '24.81 Km/h',
      direction: 357,
      battery: 100,
      gpsDate: '2019-10-12 12:36:23',
      mileage: '48.27 km',
      stopTime: '',
      lat: -6.2532115,
      long: 106.80134
  ),
  GpsModel(
      speed: '18.63 Km/h',
      direction: 290,
      battery: 100,
      gpsDate: '2019-10-12 12:36:43',
      mileage: '48.38 km',
      stopTime: '',
      lat: -6.2525716,
      long: 106.80066
  ),
  GpsModel(
      speed: '25.93 Km/h',
      direction: 256,
      battery: 100,
      gpsDate: '2019-10-12 12:37:03',
      mileage: '48.52 km',
      stopTime: '',
      lat: -6.2528167,
      long: 106.79938
  ),
  GpsModel(
      speed: '22.73 Km/h',
      direction: 258,
      battery: 100,
      gpsDate: '2019-10-12 12:37:23',
      mileage: '48.65 km',
      stopTime: '',
      lat: -6.2530184,
      long: 106.798256
  ),
  GpsModel(
      speed: '4.61 Km/h',
      direction: 290,
      battery: 100,
      gpsDate: '2019-10-12 12:38:42',
      mileage: '48.75 km',
      stopTime: '',
      lat: -6.2530365,
      long: 106.79734
  ),
  GpsModel(
      speed: '33.94 Km/h',
      direction: 5,
      battery: 100,
      gpsDate: '2019-10-12 12:39:01',
      mileage: '48.93 km',
      stopTime: '',
      lat: -6.2514315,
      long: 106.79748
  ),
  GpsModel(
      speed: '41.29 Km/h',
      direction: 4,
      battery: 100,
      gpsDate: '2019-10-12 12:39:02',
      mileage: '48.94 km',
      stopTime: '',
      lat: -6.2513285,
      long: 106.797485
  ),
  GpsModel(
      speed: '24.46 Km/h',
      direction: 14,
      battery: 100,
      gpsDate: '2019-10-12 12:39:22',
      mileage: '49.08 km',
      stopTime: '',
      lat: -6.2501082,
      long: 106.797554
  ),
  GpsModel(
      speed: '20.27 Km/h',
      direction: 269,
      battery: 100,
      gpsDate: '2019-10-12 12:39:42',
      mileage: '49.19 km',
      stopTime: '',
      lat: -6.2497134,
      long: 106.796616
  ),
  GpsModel(
      speed: '16.26 Km/h',
      direction: 9,
      battery: 100,
      gpsDate: '2019-10-12 12:40:02',
      mileage: '49.28 km',
      stopTime: '',
      lat: -6.2490835,
      long: 106.7961
  ),
  GpsModel(
      speed: '27.28 Km/h',
      direction: 324,
      battery: 100,
      gpsDate: '2019-10-12 12:40:22',
      mileage: '49.43 km',
      stopTime: '',
      lat: -6.24812,
      long: 106.79513
  ),
  GpsModel(
      speed: '21.97 Km/h',
      direction: 356,
      battery: 100,
      gpsDate: '2019-10-12 12:40:41',
      mileage: '49.55 km',
      stopTime: '',
      lat: -6.2471333,
      long: 106.79479
  ),
  GpsModel(
      speed: '6.62 Km/h',
      direction: 337,
      battery: 100,
      gpsDate: '2019-10-12 12:41:21',
      mileage: '49.62 km',
      stopTime: '',
      lat: -6.2464867,
      long: 106.79465
  ),
  GpsModel(
      speed: '2.36 Km/h',
      direction: 324,
      battery: 100,
      gpsDate: '2019-10-12 12:43:40',
      mileage: '49.71 km',
      stopTime: '',
      lat: -6.2458067,
      long: 106.79419
  ),
  GpsModel(
      speed: '14.45 Km/h',
      direction: 324,
      battery: 100,
      gpsDate: '2019-10-12 12:43:59',
      mileage: '49.79 km',
      stopTime: '',
      lat: -6.24521,
      long: 106.79385
  ),
  GpsModel(
      speed: '12.06 Km/h',
      direction: 325,
      battery: 100,
      gpsDate: '2019-10-12 12:44:00',
      mileage: '49.79 km',
      stopTime: '',
      lat: -6.2451816,
      long: 106.79384
  ),
  GpsModel(
      speed: '23.92 Km/h',
      direction: 339,
      battery: 100,
      gpsDate: '2019-10-12 12:44:20',
      mileage: '49.92 km',
      stopTime: '',
      lat: -6.244135,
      long: 106.79326
  ),
  GpsModel(
      speed: '5.49 Km/h',
      direction: 349,
      battery: 100,
      gpsDate: '2019-10-12 12:44:40',
      mileage: '49.95 km',
      stopTime: '',
      lat: -6.2438664,
      long: 106.793205
  ),
  GpsModel(
      speed: '6.91 Km/h',
      direction: 353,
      battery: 100,
      gpsDate: '2019-10-12 12:45:19',
      mileage: '50.03 km',
      stopTime: '',
      lat: -6.2432084,
      long: 106.79306
  ),
  GpsModel(
      speed: '13.2 Km/h',
      direction: 351,
      battery: 100,
      gpsDate: '2019-10-12 12:45:39',
      mileage: '50.1 km',
      stopTime: '',
      lat: -6.242553,
      long: 106.792984
  ),
  GpsModel(
      speed: '2.07 Km/h',
      direction: 312,
      battery: 100,
      gpsDate: '2019-10-12 12:47:58',
      mileage: '50.18 km',
      stopTime: '',
      lat: -6.241872,
      long: 106.792755
  ),
  GpsModel(
      speed: '21.36 Km/h',
      direction: 251,
      battery: 100,
      gpsDate: '2019-10-12 12:48:18',
      mileage: '50.3 km',
      stopTime: '',
      lat: -6.24204,
      long: 106.791695
  ),
  GpsModel(
      speed: '1.18 Km/h',
      direction: 257,
      battery: 100,
      gpsDate: '2019-10-12 12:48:57',
      mileage: '50.31 km',
      stopTime: '',
      lat: -6.242025,
      long: 106.79181
  ),
  GpsModel(
      speed: '5.12 Km/h',
      direction: 274,
      battery: 100,
      gpsDate: '2019-10-12 12:49:18',
      mileage: '50.34 km',
      stopTime: '',
      lat: -6.242018,
      long: 106.79154
  ),
  GpsModel(
      speed: '30.45 Km/h',
      direction: 277,
      battery: 100,
      gpsDate: '2019-10-12 12:49:38',
      mileage: '50.51 km',
      stopTime: '',
      lat: -6.241842,
      long: 106.79002
  ),
  GpsModel(
      speed: '29.14 Km/h',
      direction: 282,
      battery: 100,
      gpsDate: '2019-10-12 12:49:57',
      mileage: '50.67 km',
      stopTime: '',
      lat: -6.2410083,
      long: 106.78891
  ),
  GpsModel(
      speed: '26.06 Km/h',
      direction: 286,
      battery: 100,
      gpsDate: '2019-10-12 12:50:17',
      mileage: '50.81 km',
      stopTime: '',
      lat: -6.240782,
      long: 106.78762
  ),
  GpsModel(
      speed: '15.11 Km/h',
      direction: 319,
      battery: 100,
      gpsDate: '2019-10-12 12:50:37',
      mileage: '50.89 km',
      stopTime: '',
      lat: -6.2402835,
      long: 106.78705
  ),
  GpsModel(
      speed: '27.65 Km/h',
      direction: 312,
      battery: 100,
      gpsDate: '2019-10-12 12:50:57',
      mileage: '51.05 km',
      stopTime: '',
      lat: -6.239538,
      long: 106.78588
  ),
  GpsModel(
      speed: '27.16 Km/h',
      direction: 274,
      battery: 100,
      gpsDate: '2019-10-12 12:51:17',
      mileage: '51.2 km',
      stopTime: '',
      lat: -6.23953,
      long: 106.784515
  ),
  GpsModel(
      speed: '23.81 Km/h',
      direction: 295,
      battery: 100,
      gpsDate: '2019-10-12 12:51:37',
      mileage: '51.33 km',
      stopTime: '',
      lat: -6.239218,
      long: 106.78336
  ),
  GpsModel(
      speed: '19.58 Km/h',
      direction: 176,
      battery: 100,
      gpsDate: '2019-10-12 12:51:57',
      mileage: '51.44 km',
      stopTime: '',
      lat: -6.2401667,
      long: 106.78312
  ),
  GpsModel(
      speed: '21.75 Km/h',
      direction: 191,
      battery: 100,
      gpsDate: '2019-10-12 12:52:16',
      mileage: '51.55 km',
      stopTime: '',
      lat: -6.241185,
      long: 106.78295
  ),
  GpsModel(
      speed: '21.82 Km/h',
      direction: 184,
      battery: 100,
      gpsDate: '2019-10-12 12:52:36',
      mileage: '51.68 km',
      stopTime: '',
      lat: -6.2422733,
      long: 106.78289
  ),
  GpsModel(
      speed: '15.89 Km/h',
      direction: 142,
      battery: 100,
      gpsDate: '2019-10-12 12:52:56',
      mileage: '51.76 km',
      stopTime: '',
      lat: -6.243067,
      long: 106.78288
  ),
  GpsModel(
      speed: '16.67 Km/h',
      direction: 176,
      battery: 100,
      gpsDate: '2019-10-12 12:53:16',
      mileage: '51.86 km',
      stopTime: '',
      lat: -6.2438865,
      long: 106.78273
  ),
  GpsModel(
      speed: '4.02 Km/h',
      direction: 17,
      battery: 100,
      gpsDate: '2019-10-12 12:53:36',
      mileage: '51.88 km',
      stopTime: '',
      lat: -6.2439165,
      long: 106.78293
  ),
  GpsModel(
      speed: '8.59 Km/h',
      direction: 335,
      battery: 100,
      gpsDate: '2019-10-12 12:53:55',
      mileage: '51.92 km',
      stopTime: '',
      lat: -6.243513,
      long: 106.78287
  ),
  GpsModel(
      speed: '13.18 Km/h',
      direction: 333,
      battery: 100,
      gpsDate: '2019-10-12 12:53:56',
      mileage: '51.93 km',
      stopTime: '',
      lat: -6.2434816,
      long: 106.78286
  ),
  GpsModel(
      speed: '3.03 Km/h',
      direction: 340,
      battery: 100,
      gpsDate: '2019-10-12 12:54:55',
      mileage: '51.98 km',
      stopTime: '',
      lat: -6.243058,
      long: 106.783
  ),
  GpsModel(
      speed: '6.84 Km/h',
      direction: 19,
      battery: 100,
      gpsDate: '2019-10-12 12:55:15',
      mileage: '52.02 km',
      stopTime: '',
      lat: -6.2427235,
      long: 106.78307
  ),
  GpsModel(
      speed: '2.31 Km/h',
      direction: 68,
      battery: 100,
      gpsDate: '2019-10-12 12:55:35',
      mileage: '52.03 km',
      stopTime: '',
      lat: -6.242615,
      long: 106.78311
  ),
  GpsModel(
      speed: '0.87 Km/h',
      direction: 138,
      battery: 100,
      gpsDate: '2019-10-12 12:55:55',
      mileage: '52.03 km',
      stopTime: '',
      lat: -6.2426467,
      long: 106.78314
  ),
  GpsModel(
      speed: '4.24 Km/h',
      direction: 273,
      battery: 100,
      gpsDate: '2019-10-12 12:56:15',
      mileage: '52.06 km',
      stopTime: '2 jam ',
      lat: -6.242855,
      long: 106.7831
  ),
  GpsModel(
      speed: '0.03 Km/h',
      direction: 192,
      battery: 100,
      gpsDate: '2019-10-12 14:56:42',
      mileage: '52.13 km',
      stopTime: '',
      lat: -6.243467,
      long: 106.78297
  ),
  GpsModel(
      speed: '8.04 Km/h',
      direction: 197,
      battery: 100,
      gpsDate: '2019-10-12 14:57:02',
      mileage: '52.17 km',
      stopTime: '',
      lat: -6.2438216,
      long: 106.78278
  ),
  GpsModel(
      speed: '4.16 Km/h',
      direction: 177,
      battery: 100,
      gpsDate: '2019-10-12 14:57:21',
      mileage: '52.19 km',
      stopTime: '',
      lat: -6.2440186,
      long: 106.78277
  ),
  GpsModel(
      speed: '3.56 Km/h',
      direction: 201,
      battery: 100,
      gpsDate: '2019-10-12 14:59:01',
      mileage: '52.29 km',
      stopTime: '',
      lat: -6.244808,
      long: 106.78236
  ),
  GpsModel(
      speed: '7.51 Km/h',
      direction: 200,
      battery: 100,
      gpsDate: '2019-10-12 14:59:21',
      mileage: '52.33 km',
      stopTime: '',
      lat: -6.245148,
      long: 106.7822
  ),
  GpsModel(
      speed: '4.44 Km/h',
      direction: 190,
      battery: 100,
      gpsDate: '2019-10-12 14:59:40',
      mileage: '52.36 km',
      stopTime: '',
      lat: -6.2453485,
      long: 106.782135
  ),
  GpsModel(
      speed: '4.44 Km/h',
      direction: 195,
      battery: 100,
      gpsDate: '2019-10-12 15:00:00',
      mileage: '52.38 km',
      stopTime: '',
      lat: -6.245547,
      long: 106.782036
  ),
  GpsModel(
      speed: '22.02 Km/h',
      direction: 203,
      battery: 100,
      gpsDate: '2019-10-12 15:00:08',
      mileage: '52.43 km',
      stopTime: '',
      lat: -6.245955,
      long: 106.78187
  ),
  GpsModel(
      speed: '25.54 Km/h',
      direction: 196,
      battery: 100,
      gpsDate: '2019-10-12 15:00:20',
      mileage: '52.52 km',
      stopTime: '',
      lat: -6.2466683,
      long: 106.78159
  ),
  GpsModel(
      speed: '20.9 Km/h',
      direction: 187,
      battery: 100,
      gpsDate: '2019-10-12 15:00:40',
      mileage: '52.63 km',
      stopTime: '',
      lat: -6.2476916,
      long: 106.78138
  ),
  GpsModel(
      speed: '30.5 Km/h',
      direction: 170,
      battery: 100,
      gpsDate: '2019-10-12 15:01:00',
      mileage: '52.8 km',
      stopTime: '',
      lat: -6.249215,
      long: 106.78134
  ),
  GpsModel(
      speed: '19.02 Km/h',
      direction: 173,
      battery: 100,
      gpsDate: '2019-10-12 15:01:20',
      mileage: '52.91 km',
      stopTime: '',
      lat: -6.2501535,
      long: 106.78149
  ),
  GpsModel(
      speed: '16.12 Km/h',
      direction: 176,
      battery: 100,
      gpsDate: '2019-10-12 15:01:40',
      mileage: '53 km',
      stopTime: '',
      lat: -6.250953,
      long: 106.78159
  ),
  GpsModel(
      speed: '22.51 Km/h',
      direction: 176,
      battery: 100,
      gpsDate: '2019-10-12 15:01:59',
      mileage: '53.12 km',
      stopTime: '',
      lat: -6.2520185,
      long: 106.78167
  ),
  GpsModel(
      speed: '23.63 Km/h',
      direction: 178,
      battery: 100,
      gpsDate: '2019-10-12 15:02:19',
      mileage: '53.25 km',
      stopTime: '',
      lat: -6.253198,
      long: 106.781715
  ),
  GpsModel(
      speed: '10.11 Km/h',
      direction: 179,
      battery: 100,
      gpsDate: '2019-10-12 15:02:59',
      mileage: '53.36 km',
      stopTime: '',
      lat: -6.2542086,
      long: 106.78171
  ),
  GpsModel(
      speed: '6 Km/h',
      direction: 175,
      battery: 100,
      gpsDate: '2019-10-12 15:03:19',
      mileage: '53.39 km',
      stopTime: '',
      lat: -6.2545085,
      long: 106.781715
  ),
  GpsModel(
      speed: '9.4 Km/h',
      direction: 178,
      battery: 100,
      gpsDate: '2019-10-12 15:03:39',
      mileage: '53.44 km',
      stopTime: '',
      lat: -6.254978,
      long: 106.781715
  ),
  GpsModel(
      speed: '30.99 Km/h',
      direction: 179,
      battery: 100,
      gpsDate: '2019-10-12 15:03:59',
      mileage: '53.62 km',
      stopTime: '',
      lat: -6.2565265,
      long: 106.78172
  ),
  GpsModel(
      speed: '41.82 Km/h',
      direction: 178,
      battery: 100,
      gpsDate: '2019-10-12 15:04:18',
      mileage: '53.84 km',
      stopTime: '',
      lat: -6.2585115,
      long: 106.78174
  ),
  GpsModel(
      speed: '42.16 Km/h',
      direction: 170,
      battery: 100,
      gpsDate: '2019-10-12 15:04:38',
      mileage: '54.07 km',
      stopTime: '',
      lat: -6.2606134,
      long: 106.78188
  ),
  GpsModel(
      speed: '32.35 Km/h',
      direction: 121,
      battery: 100,
      gpsDate: '2019-10-12 15:04:58',
      mileage: '54.25 km',
      stopTime: '',
      lat: -6.262,
      long: 106.782715
  ),
  GpsModel(
      speed: '21.69 Km/h',
      direction: 126,
      battery: 100,
      gpsDate: '2019-10-12 15:05:06',
      mileage: '54.3 km',
      stopTime: '',
      lat: -6.262265,
      long: 106.78306
  ),
  GpsModel(
      speed: '29.06 Km/h',
      direction: 160,
      battery: 100,
      gpsDate: '2019-10-12 15:05:18',
      mileage: '54.4 km',
      stopTime: '',
      lat: -6.2629733,
      long: 106.78357
  ),
  GpsModel(
      speed: '20.2 Km/h',
      direction: 54,
      battery: 100,
      gpsDate: '2019-10-12 15:05:38',
      mileage: '54.51 km',
      stopTime: '',
      lat: -6.2631483,
      long: 106.78457
  ),
  GpsModel(
      speed: '32.95 Km/h',
      direction: 108,
      battery: 100,
      gpsDate: '2019-10-12 15:05:58',
      mileage: '54.69 km',
      stopTime: '',
      lat: -6.2630067,
      long: 106.78622
  ),
  GpsModel(
      speed: '29.89 Km/h',
      direction: 105,
      battery: 100,
      gpsDate: '2019-10-12 15:06:18',
      mileage: '54.86 km',
      stopTime: '',
      lat: -6.263358,
      long: 106.78768
  ),
  GpsModel(
      speed: '12.87 Km/h',
      direction: 177,
      battery: 100,
      gpsDate: '2019-10-12 15:06:37',
      mileage: '54.93 km',
      stopTime: '',
      lat: -6.26356,
      long: 106.78826
  ),
  GpsModel(
      speed: '3.63 Km/h',
      direction: 181,
      battery: 100,
      gpsDate: '2019-10-12 15:06:57',
      mileage: '54.95 km',
      stopTime: '13 jam 29 menit',
      lat: -6.26374,
      long: 106.78828
  )
];