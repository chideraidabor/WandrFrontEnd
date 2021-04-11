import 'package:wandr_frontend/model/placeInfo.dart';

class Eventitem {
  PlaceInfo placeInfo;

  final int eventId;
  final String eventTitle;
  final DateTime createdAt;
  //final createdAt = new DateTime.now();
  final DateTime eventStartTime;
  final DateTime eventEndTime;

  Eventitem(
      {this.eventId,
      this.eventTitle,
      this.createdAt,
      this.eventStartTime,
      this.eventEndTime});

  factory Eventitem.fromJson(Map<String, dynamic> json) {
    return Eventitem(
        eventId: json['EventId'],
        eventTitle: json['Title'],
        createdAt: DateTime.parse(json['CreatedAt']),
        eventStartTime: DateTime.parse(json['EventStartTime']),
        eventEndTime: DateTime.parse(json['EventEndTime']));
  }
}
