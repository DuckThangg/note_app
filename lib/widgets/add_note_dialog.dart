import 'package:flutter/material.dart';
import 'package:ghi_chi_project/models/note.dart';

class AddNoteDialog extends StatelessWidget {
  final Note? note;
  final Function(Note) onAddNote;

  AddNoteDialog({this.note, required this.onAddNote});

  @override
  Widget build(BuildContext context) {
    String title = note?.title ?? '';
    String content = note?.content ?? '';

    return AlertDialog(
      title: Text(note == null ? 'Add Note' : 'Edit Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              title = value;
            },
            controller: TextEditingController(text: title),
            decoration: InputDecoration(hintText: "Title"),
          ),
          TextField(
            onChanged: (value) {
              content = value;
            },
            controller: TextEditingController(text: content),
            decoration: InputDecoration(hintText: "Content"),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(note == null ? 'Add' : 'Save'),
          onPressed: () {
            if (title.isNotEmpty && content.isNotEmpty) {
              onAddNote(Note()
                ..title = title
                ..content = content);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
