import 'package:wandr_frontend/model/placeInfo.dart';

class EventItem {
  PlaceInfo placeInfo;

  final int eventId;
  final String eventTitle;
  final DateTime createdAt;
  //final createdAt = new DateTime.now();
  final DateTime eventStartTime;
  final DateTime eventEndTime;

  EventItem(
      {this.eventId,
      this.eventTitle,
      this.createdAt,
      this.eventStartTime,
      this.eventEndTime});

  factory EventItem.fromJson(Map<String, dynamic> json) {
    return EventItem(
        eventId: json['EventId'],
        eventTitle: json['Title'],
        createdAt: DateTime.parse(json['CreatedAt']),
        eventStartTime: DateTime.parse(json['EventStartTime']),
        eventEndTime: DateTime.parse(json['EventEndTime']));
  }
}
