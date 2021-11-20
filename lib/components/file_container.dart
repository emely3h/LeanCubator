import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileContainer extends StatefulWidget {
  const FileContainer({Key? key}) : super(key: key);

  @override
  _FileContainerState createState() => _FileContainerState();
}

class _FileContainerState extends State<FileContainer> {
  List<String> filenames = [
    'file1.pdf',
    'file1.img',
    'file1.jpg',
    'file1.doc',
    'file1.txt',
  ];

  Icon find_icon(String filename) {
    String file_end = filename.split('.')[1];
    // excel pdf, word, bild, txt, link
    Icon icon = Icon(Icons.file_copy_outlined);
    switch (file_end) {
      case 'pdf':
        icon = Icon(Icons.file_copy_outlined);
        break;
      case 'img':
        icon = Icon(Icons.image);
        break;
      case 'jpg':
        icon = Icon(Icons.image);
        break;
      case 'doc':
        icon = Icon(Icons.file_copy_outlined);
        break;
      case 'txt':
        icon = Icon(Icons.text_fields);
        break;
    }

    return icon;
  }

  void delete_file(int index) {
    filenames.removeAt(index);
    setState(() {});
  }

  Future<void> pick_file() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      var fileBytes = result.files.first.bytes;
      var fileName = result.files.first.name;
      filenames.add(fileName);
      setState(() {});

      // upload file
      //await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 500,
                height: 350,
                child: ListView.builder(
                  itemCount: filenames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ListTile(
                        leading: find_icon(filenames[index]),
                        title: Text(filenames[index]),
                        trailing: InkWell(
                          child: Icon(Icons.delete),
                          onTap: () {
                            delete_file(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                    child: Icon(Icons.add), onPressed: pick_file),
              ],
            ),
          )
        ],
      ),
    );
  }
}
