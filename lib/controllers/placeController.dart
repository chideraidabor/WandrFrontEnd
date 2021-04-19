import 'package:flutter/material.dart';

import 'package:wandr_frontend/services/apiManager.dart';

import '../model/placeInfo.dart';

class PlaceController {
  int _id;
  List<PlaceInfo> _placeInfo;
  bool isLoading = true;

  void setId(int id) {
    this._id = id;
  }

  int getId() {
    return this._id;
  }

  getPlaceData() async {
    _placeInfo =
        (await API_Manager().getCertainPlace(id: _id)).cast<PlaceInfo>();
    isLoading = false;
    return _placeInfo;
  }
}
