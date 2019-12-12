import 'dart:core';
import 'package:flutter/material.dart';
import 'package:my_app/repositories/event/event_repository.dart';
import 'package:provider/provider.dart';

class EventListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EventListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventRepository>(
      builder: (context, repo, child) => Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Events',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: repo.events.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(
                child: Text(
                  'Entry ${repo.events[index].name}',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/events/create');
          },
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
