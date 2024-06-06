import 'package:flutter/material.dart';
import 'note_folder_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> folders = ["Work", "Personal", "Ideas"];

  void _addFolder(String folderName) {
    setState(() {
      folders.add(folderName);
    });
  }

  void _showAddFolderDialog() {
    String folderName = "";

    showDialog(
      context: context,
      builder: (context) {
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
                  _addFolder(folderName);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddFolderDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: folders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(folders[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteFolderScreen(folderName: folders[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
