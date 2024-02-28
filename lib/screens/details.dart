import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';

import '../domain/models/entry.dart';
import '../utils/fonts.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.entry}) : super(key: key);
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          daoController.saveEntry(entry: entry);
        },
        child: const Icon(Icons.bookmark),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(style: AppFonts.entryCardTextStyle, entry.name.toUpperCase()),
            Wrap(
              children: entry
                  .commonLocationsConverter()
                  .map((e) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 4, 8),
                    child: Chip(label: Text(e)),
                  ))
                  .toList(),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                entry.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(entry.description),
            )
          ],
        ),
      ),
    ));
  }
}
