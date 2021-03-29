import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:wandr_frontend/model/appTab.dart';

import 'tabEvent.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.search);

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is TabUpdated) {
      yield event.tab;
    }
  }
}
