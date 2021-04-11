import 'package:flutter/material.dart';

import 'package:wandr_frontend/services/apiManager.dart';

import '../model/EventInfo.dart';

class EventController extends ChangeNotifier {
  int _id;
  List<Eventitem> _eventItem;
  bool isLoading = true;
  DateTime selectedDate;
  external DateTime add(Duration duration);

  void setId(int id) {
    this._id = id;
    isLoading = true;
    selectedDate = DateTime.now();
  }

  int getId() {
    return this._id;
  }

  void setEventItem(List<Eventitem> eventItem) {
    this._eventItem = eventItem;
  }

  List<Eventitem> getEventItem() {
    notifyListeners();
    return this._eventItem;
  }

  getEventData() async {
    notifyListeners();
    _eventItem =
        (await API_Manager().getCertainEvent(id: _id)).cast<Eventitem>();
    isLoading = false;
    notifyListeners();
    return _eventItem;
  }

  void addDay() {
    selectedDate = selectedDate.add(const Duration(days: 1));
    notifyListeners();
  }

  void subtractDay() {
    selectedDate = selectedDate.subtract(const Duration(days: 1));
    notifyListeners();
  }

  void updateDay(DateTime selectedDay) {
    selectedDate = selectedDay;
    notifyListeners();
  }
}
