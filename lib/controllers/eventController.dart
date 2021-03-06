import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  getEventData({@required BuildContext context}) async {
    notifyListeners();
    _eventItem = await API_Manager().getDateOfEvents(
        id: _id.toString(),
        context: context,
        date: "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}");
    isLoading = false;
    notifyListeners();
    return _eventItem;
  }

  void addDay(BuildContext context) {
    selectedDate = selectedDate.add(const Duration(days: 1));
    getEventsOfParticularDay();
    notifyListeners();
  }

  void subtractDay(BuildContext context) {
    selectedDate = selectedDate.subtract(const Duration(days: 1));
    //getEventData(context: context);
    notifyListeners();
  }

  Future updateDay(DateTime selectedDay) async {
    selectedDate = selectedDay;
    await getEventsOfParticularDay();
    notifyListeners();
  }

  Future getEventsOfParticularDay() async {
    _eventItem = await API_Manager().getDateOfEvents(
        id: _id.toString(),
        date: "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}");
    notifyListeners();
  }
}
