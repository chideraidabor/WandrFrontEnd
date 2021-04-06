import 'package:flutter/material.dart';
import 'package:wandr_frontend/model/EventInfo.dart';
import 'package:wandr_frontend/services/apiManager.dart';

class EventController extends ChangeNotifier {
  int _id;
  List<EventItem> _eventItem;
  bool isLoading = true;

  void setId(int id) {
    this._id = id;
    isLoading = true;
  }

  int getId() {
    return this._id;
  }

  void setEventItem(List<EventItem> eventItem) {
    this._eventItem = eventItem;
  }

  List<EventItem> getEventItem() {
    notifyListeners();
    return this._eventItem;
  }

  getEventData() async {
    notifyListeners();
    _eventItem =
        (await API_Manager().getCertainEvent(id: _id)).cast<EventItem>();
    isLoading = false;
    notifyListeners();
    return _eventItem;
  }
}
