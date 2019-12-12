const String createEventMutation = '''
mutation CreateEvent(\$input: CreateEventInput!) {
  createEvent(input: \$input) {
    name
    when
    where
    description
  }
}
''';

const String updateEventMutation = '''
mutation UpdateEvent(\$input: UpdateEventInput!) {
  updateEvent(input: \$input) {
    id
    name
    when
    where
    description
  }
}
''';

const String listEventsQuery = '''
  query listEvents {
    listEvents {
      items {
        id
        name
        when
        where
        description
      }
    }
  }
''';