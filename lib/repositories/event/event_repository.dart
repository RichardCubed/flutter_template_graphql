import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:my_app/libraries/graph_client.dart';

import 'event_model.dart';
import 'event_mutations.dart';

class EventRepository extends ChangeNotifier {

  /*
   *  Wrap our repository in a simple singleton, we can replace this later with a
   *  more serious DI container.
   */
  static final EventRepository _instance = EventRepository._internal();
  factory EventRepository() {
    return _instance;
  }

  /*
   *  Fetch our initial data in the constructor.
   */
  EventRepository._internal() {
    listEvents();
  }

  /*
   *  Backing storage for our events
   */
  final List<EventModel> _events = [];
  UnmodifiableListView<EventModel> get events => UnmodifiableListView(_events);

  /*
   *  Deserialise a single event from a GraphQL queryResult, add it to 
   *  the local collection and notify any listeners.
   */
  void _toEvent(QueryResult queryResult) {
    _events.add(EventModel.fromJson(queryResult.data['createEvent'])); 
    notifyListeners();
  }

  /*
   *  Deserialise a list of events from a GraphQL queryResult, add them
   *  to the local collection and notify any listeners.
   */
  void _toEvents(QueryResult queryResult) {
    for (var i=0; i<queryResult.data['listEvents']['items'].length; i++) {
      _events.add(EventModel.fromJson(queryResult.data['listEvents']['items'][i]));
    }     
    notifyListeners();
  }

  /*
   *  Creates a new event using the data from the form and the createEventMutation
   *  mutation.
   */
  void createEvent(Map<String, String> form) {
    GraphClient()
        .client
        .mutate(MutationOptions(document: createEventMutation, variables: {"input": form}))
        .then(_toEvent);
  }

  /*
   *  Updates an existing event using the data from the form and the createEvent
   *  mutation.
   */
  void updateEvent(Map<String, String> form) {
    GraphClient()
        .client
        .mutate(MutationOptions(document: updateEventMutation, variables: {"input": form}))
        .then(_toEvent);
  }

  /*
   *  Fetch a list of events via a GraphQL query
   */
  void listEvents() {
    GraphClient()
        .client
        .query(QueryOptions(document: listEventsQuery))
        .then(_toEvents);
  }
  
}
