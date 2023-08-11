class GeofenceModel {
  late int id;
  late String geoName;
  late String geoDesc;
  late double geoLat;
  late double geoLong;
  late double geoRad;
  late int geoActive;

  GeofenceModel({required this.id, required this.geoName, required this.geoDesc, required this.geoLat, required this.geoLong, required this.geoRad, required this.geoActive});

  GeofenceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    geoName = json['geoName'];
    geoDesc = json['geoDesc'];
    geoLat = json['geoLat'].toDouble();
    geoLong = json['geoLong'].toDouble();
    geoRad = json['geoRad'].toDouble();
    geoRad = json['geoActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['geoName'] = this.geoName;
    data['geoDesc'] = this.geoDesc;
    data['geoLat'] = this.geoLat;
    data['geoLong'] = this.geoLong;
    data['geoRad'] = this.geoRad;
    data['geoActive'] = this.geoActive;
    return data;
  }

  void setActive(int i) {
    int active = i - 1;
    geoActive = active.abs();
  }
}

List<GeofenceModel> geofenceData = [
  GeofenceModel(
      id: 1,
      geoName: 'Office Area',
      geoDesc: 'This is the area of my office, it is around 200 meters',
      geoLat: -6.168033,
      geoLong: 106.900467,
      geoRad: 200,
      geoActive: 1
  ),
  GeofenceModel(
      id: 2,
      geoName: 'Home Area',
      geoDesc: 'This is the area of my home, it is around 150 meters',
      geoLat: -6.162608,
      geoLong: 106.901966,
      geoRad: 150,
      geoActive: 1
  ),
  GeofenceModel(
      id: 3,
      geoName: 'Lotte Mart Area',
      geoDesc: 'This is the area of Lotte Mart, it is around 165 meters',
      geoLat: -6.153578,
      geoLong: 106.895669,
      geoRad: 165,
      geoActive: 1
  ),
  GeofenceModel(
      id: 4,
      geoName: 'Sunlake Hotel',
      geoDesc: 'This is the area of Sunlake Hotel, it is around 130 meters',
      geoLat: -6.146770,
      geoLong: 106.880045,
      geoRad: 130,
      geoActive: 1
  ),
  GeofenceModel(
      id: 5,
      geoName: 'Monas Area',
      geoDesc: 'This is the area of Monas, it is around 560 meters',
      geoLat: -6.175144,
      geoLong: 106.827104,
      geoRad: 560,
      geoActive: 1
  ),
  GeofenceModel(
      id: 6,
      geoName: 'GBK Area',
      geoDesc: 'This is the area of Monas, it is around 740 meters',
      geoLat: -6.218392,
      geoLong: 106.802737,
      geoRad: 740,
      geoActive: 1
  ),
  GeofenceModel(
      id: 7,
      geoName: 'Central Park Jakarta',
      geoDesc: 'This is the area of Central Park Mall in Jakarta, it is around 170 meters',
      geoLat: -6.177228,
      geoLong: 106.790634,
      geoRad: 170,
      geoActive: 1
  ),
];