import 'package:flutter/material.dart';

class AddFolderDialog extends StatelessWidget {
  final Function(String) onAddFolder;

  AddFolderDialog({required this.onAddFolder});

  @override
  Widget build(BuildContext context) {
    String folderName = '';

    return AlertDialog(
      title: Text('Add Folder'),
      content: TextField(
        onChanged: (value) {
          folderName = value;
        },
        decoration: InputDecoration(hintText: "Folder Name"),
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
            if (folderName.isNotEmpty) {
              onAddFolder(folderName);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
