import 'dart:core';

/*
 *  Encapsulates an event
 */
class EventModel {
  String __typename;
  String id;
  String name;
  String when;
  String where;
  String description;

  EventModel();
  EventModel.from(this.__typename, this.id, this.name, this.when, this.where, this.description);

  factory EventModel.fromJson(Map<String, dynamic> parsedJson) {
    return EventModel.from(
      parsedJson['__typename'],
      parsedJson['id'],
      parsedJson['name'],
      parsedJson['when'],
      parsedJson['where'],
      parsedJson['description'],
    );
  }

  String cacheKey() {
    return '$__typename/$id';
  }
}
