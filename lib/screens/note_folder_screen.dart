import 'package:flutter/material.dart';
import 'package:ghi_chi_project/widgets/add_note_dialog.dart';
import 'package:ghi_chi_project/models/note.dart';
import 'package:hive/hive.dart';

class NoteFolderScreen extends StatefulWidget {
  final String folderName;

  NoteFolderScreen({required this.folderName});

  @override
  _NoteFolderScreenState createState() => _NoteFolderScreenState();
}

class _NoteFolderScreenState extends State<NoteFolderScreen> {
  List<Note> notes = [];

  void _addNote() {
    showDialog(
      context: context,
      builder: (context) => AddNoteDialog(onAddNote: (Note note) {
        setState(() {
          notes.add(note);
        });
      }),
    );
  }

  void _editNote(int index) {
    showDialog(
      context: context,
      builder: (context) => AddNoteDialog(
        note: notes[index],
        onAddNote: (Note editedNote) {
          setState(() {
            notes[index] = editedNote;
          });
        },
      ),
    );
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.folderName} Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addNote,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].content),
            onTap: () => _editNote(index),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteNote(index),
            ),
          );
        },
      ),
    );
  }
}
