import 'package:flutter/material.dart';
import 'package:hyrule/domain/models/entry.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Ink(
              child: Row(
                children: <Widget>[
                  Image.network(entry.img),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text(entry.name), Text(entry.description)],
                  )
                ],
              ),
            ),
          ),
          Wrap(
            children: entry.commonLocationsConverter().map(
                  (e) => Chip(
                    label: Text(e),
                  ),
                ).toList(),
          )
        ],
      ),
    );
  }
}
