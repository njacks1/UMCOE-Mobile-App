import 'package:bloc/bloc.dart';
import 'package:coe_mobile_app/MenuPages/MessagesPage.dart';
import 'package:coe_mobile_app/MenuPages/CardsPage.dart';
import 'package:coe_mobile_app/MenuPages/UtilityBills.dart';
import 'package:coe_mobile_app/pages/swipe.dart';
import 'package:flutter/cupertino.dart';



enum NavigationEvents {
  DashboardClickedEvent,
  MessagesClickedEvent,
  UtilityClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc({@required this.onMenuTap});

  @override
  NavigationStates get initialState => MyHomePage(
    onMenuTap1: onMenuTap,
  );

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DashboardClickedEvent:
        yield MyHomePage(
          onMenuTap1: onMenuTap,
        );
        break;
      case NavigationEvents.MessagesClickedEvent:
        yield MessagesPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.UtilityClickedEvent:
        yield SettingsPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}
