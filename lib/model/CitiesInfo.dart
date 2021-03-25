

class CityInfo{

  final String cityName;
  final String stateProvince;

  CityInfo({this.cityName, this.stateProvince});

  factory CityInfo.fromJson(Map<String, dynamic> json) {
    return CityInfo(
      cityName: json['Name'],
      stateProvince: json['StateProvince'],
    );
  }
}