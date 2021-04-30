import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_layout/person_detail.dart';
import 'package:flutter_layout/widgets/people_list.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String, dynamic> selectedPerson;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          return PeopleList(onPersonTap: (json) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PersonDetail(json)));
          });
        } else {
          if(selectedPerson == null) {
            return PeopleList(onPersonTap: (json) {
              setState(() {
                selectedPerson = json;
              });
            });
          } else {
            return Row(
              children: [
                SizedBox(
                  width: constrains.maxWidth/2,
                  child: PeopleList(onPersonTap: (json) {
                    setState(() {
                      selectedPerson = json;
                    });
                  }),
                ),
                SizedBox(
                  width: constrains.maxWidth/2,
                  child: PersonDetail(selectedPerson),
                )
              ],
            );
          }
        }
      },
    );
  }
}

