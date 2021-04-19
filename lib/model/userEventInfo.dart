class UserEventInfo {
  final int eventId;
  final String eventTitle;
  final DateTime createdAt;
  final DateTime eventStartTime;
  final DateTime eventEndTime;
  final int placeID;
  final int userID;
  final String location;

  UserEventInfo(
      {this.eventId,
      this.eventTitle,
      this.createdAt,
      this.eventStartTime,
      this.eventEndTime,
      this.placeID,
      this.userID,
      this.location});

  factory UserEventInfo.fromJson(Map<String, dynamic> json) {
    return UserEventInfo(
        eventId: json['EventId'],
        eventTitle: json['Title'],
        createdAt: DateTime.parse(json['CreatedAt']),
        eventStartTime: DateTime.parse(json['EventStartTime']),
        eventEndTime: DateTime.parse(json['EventEndTime']),
        placeID: json['placeID'],
        userID: json['userID'],
        location: json['Location']);
  }
}
