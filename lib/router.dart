import 'package:flutter/material.dart';

import 'package:my_app/areas/events/create/view.dart';
import 'package:my_app/areas/events/list/view.dart';
import 'package:my_app/components/my_page_route.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/events/list':
        return MyPageRoute(builder: (_) => EventListView());
      case '/events/create':
        return MyPageRoute(builder: (_) => EventCreateView());
      default:
        return MyPageRoute(builder: (_) => EventListView());
    }
  }
}