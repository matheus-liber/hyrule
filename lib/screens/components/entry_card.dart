import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';
import 'package:hyrule/utils/fonts.dart';

class EntryCard extends StatelessWidget {
  EntryCard({Key? key, required this.entry, required this.isSaved})
      : super(key: key);
  final Entry entry;
  final bool isSaved;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        direction:
            isSaved ? DismissDirection.endToStart : DismissDirection.none,
        key: ValueKey<int>(entry.id),
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
        },
        child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(entry: entry)));
                  },
                  child: Ink(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 112,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              entry.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Text(style: AppFonts.entryCardTextStyle, entry.name.toUpperCase()),
                                ),
                                Text(entry.description),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                color: const Color(0xFF3B4858),
                child: Wrap(
                  children: entry
                      .commonLocationsConverter()
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),

      ),
    );
  }
}
