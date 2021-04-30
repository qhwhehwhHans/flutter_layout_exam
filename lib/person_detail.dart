import 'package:flutter/material.dart';

class PersonDetail extends StatelessWidget {

  final Map<String,dynamic> _person;

  const PersonDetail(this._person,{Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyanAccent,
      child: Center(
        child: Text("${_person['first_name']} ${_person['last_name']}"),
      ),
    );
  }
}
