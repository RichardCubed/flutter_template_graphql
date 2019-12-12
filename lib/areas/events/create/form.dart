class EventForm {
  Map<String, String> values = {
    "name": null,
    "when": null,
    "where": null,
    "description": null
  };
}

class Validators {
  String validateName(String arg) {
    if (arg.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }
}
