import 'package:flutter/material.dart';
import 'package:flutter_layout/json_data.dart';
import 'package:flutter_layout/person_detail.dart';

class PeopleList extends StatefulWidget {

  final Function(Map<String, dynamic>) onPersonTap;

  const PeopleList({Key key, @required this.onPersonTap}) : super(key: key);

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  int selsectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          selected: selsectedIndex == index,
          title: Text(jsonData[index]["first_name"]),
          onTap: (){
            setState(() {
              selsectedIndex = index;
            });
            return widget.onPersonTap(jsonData[index]);
          },
        );
      }, itemCount: jsonData.length,),
    );
  }
}
