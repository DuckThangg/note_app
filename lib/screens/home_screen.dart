import 'package:flutter/material.dart';
import 'package:ghi_chi_project/screens/note_folder_screen.dart';
import 'package:ghi_chi_project/widgets/add_folder_dialog.dart';

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
    showDialog(
      context: context,
      builder: (context) => AddFolderDialog(onAddFolder: _addFolder),
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
      body: ListView.builder(
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
    );
  }
}
