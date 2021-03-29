import 'package:flutter/material.dart';
import 'package:wandr_frontend/keys.dart';
import 'package:wandr_frontend/model/appTab.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: WandrKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        switch (tab) {
          case AppTab.search:
            return BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                key: WandrKeys.searchTab,
              ),
              label: 'Search',
            );
            break;
          case AppTab.events:
            return BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                key: WandrKeys.eventsTab,
              ),
              label: 'Events',
            );
            break;
          case AppTab.chats:
            return BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                key: WandrKeys.chatsTab,
              ),
              label: 'Chats',
            );
            break;
          default:
        }
      }).toList(),
    );
  }
}
