import 'package:flutter/material.dart';
import 'package:my_app/repositories/event/event_repository.dart';
import 'package:my_app/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<EventRepository>(
      create: (_) => EventRepository(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: '/invoices/list',
    );
  }
}
