import 'package:flutter/material.dart';

class NoteFolderScreen extends StatefulWidget {
  final String folderName;

  NoteFolderScreen({required this.folderName});

  @override
  _NoteFolderScreenState createState() => _NoteFolderScreenState();
}

class _NoteFolderScreenState extends State<NoteFolderScreen> {
  List<String> notes = ["Note 1", "Note 2", "Note 3"];

  void _addNote() {
    String noteContent = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            onChanged: (value) {
              noteContent = value;
            },
            decoration: InputDecoration(hintText: "Note Content"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (noteContent.isNotEmpty) {
                  setState(() {
                    notes.add(noteContent);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _editNote(int index) {
    String noteContent = notes[index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Note'),
          content: TextField(
            onChanged: (value) {
              noteContent = value;
            },
            controller: TextEditingController(text: notes[index]),
            decoration: InputDecoration(hintText: "Note Content"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  notes[index] = noteContent;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
            title: Text(notes[index]),
            onTap: () {
              _editNote(index);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteNote(index);
              },
            ),
          );
        },
      ),
    );
  }
}
