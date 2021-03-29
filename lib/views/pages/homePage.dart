import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wandr_frontend/blocs/tab/tab.dart';
import 'package:wandr_frontend/model/appTab.dart';
import 'package:wandr_frontend/views/tabs/tabs.dart';
import 'package:wandr_frontend/views/widgets/tabSelector.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(),
        ),
        bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab))),
        body: () {
          switch (activeTab) {
            case AppTab.search:
              return SearchTab();
            case AppTab.chats:
              return ChatTab();
            case AppTab.events:
              return EventTab();
          }
        }(),
      );
    });
  }
}
