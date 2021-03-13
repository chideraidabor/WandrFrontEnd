
import 'package:flutter/material.dart';
import 'dart:convert';

class PlaceInfo {
  final int placeId;
  final String name;
  final String type;
  final String description;
  final String location;

  PlaceInfo({this.placeId, this.name, this.type, this.description, this.location});

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
      placeId: json['PlaceID'],
      name: json['Name'],
      type: json['Type'],
      description: json['Description'],
      location: json['Location'],
    );
  }
}
