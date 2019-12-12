import 'dart:core';

import 'package:flutter/material.dart';
import 'package:my_app/areas/events/create/form.dart';
import 'package:my_app/components/my_text_field.dart';
import 'package:my_app/repositories/event/event_repository.dart';

class EventCreateView extends StatefulWidget with Validators {
  final EventRepository repo = EventRepository();
  final EventForm form = EventForm();
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EventCreateView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Create Event',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                MyFormField(
                  labelText: "Name",
                  validator: (val) {
                    return widget.validateName(val);
                  },
                  onSaved: (val) {
                    widget.form.values["name"] = val;
                  },
                ),
                MyFormField(
                  labelText: "When",
                  onSaved: (val) {
                    widget.form.values["when"] = val;
                  },
                ),
                MyFormField(
                  labelText: "Where",
                  onSaved: (val) {
                    widget.form.values["where"] = val;
                  },
                ),
                MyFormField(
                  labelText: "Description",
                  onSaved: (val) {
                    widget.form.values["description"] = val;
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        widget.repo.createEvent(widget.form.values);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
