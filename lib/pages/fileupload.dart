import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subTitle;
  final dynamic user;

  const CommonAppBar(this.title, this.subTitle, this.user, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          if (subTitle.isNotEmpty)
            Text(
              subTitle,
              style: const TextStyle(fontSize: 12),
            ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            // Implement your logic here to navigate to the user profile page
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Implement your logic here to handle logout
          },
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class FileUploadPage extends StatefulWidget {
  FileUploadPage(this.assignment, this.user, {Key? key}) : super(key: key);
  var assignment;
  var user;

  @override
  _FileUploadPageState createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  Dio dio = Dio();
  String _uploadResult = '';
  String? _filePath;

  Future<void> _chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.first.path!;
        _uploadResult = 'File selected: $_filePath';
      });
    } else {
      // User canceled file selection
      setState(() {
        _uploadResult = 'No file selected.';
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_filePath != null) {
      try {
        String fileName = _filePath!.split('/').last;

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(_filePath!, filename: fileName),
        });

        Response response = await dio.post(
          'https://eludebackend.onrender.com/upload',
          data: formData,
        );

        String fileId = response.data.toString();

        // Store the file ID in the MongoDB document
        await _storeFileId(fileId);

        setState(() {
          _uploadResult = 'File uploaded successfully. ID: $fileId';
        });

        // Navigate back to the previous page
        Navigator.pop(context);
      } catch (error) {
        setState(() {
          _uploadResult = 'Error: ${error.toString()}';
        });
      }
    } else {
      setState(() {
        _uploadResult = 'No file selected.';
      });
    }
  }

  Future<void> _storeFileId(String fileId) async {
    var db = await mongo.Db.create(
        'mongodb+srv://admin_kp:admin123@cluster0.hlr4lt7.mongodb.net/e-class?retryWrites=true&w=majority');
    await db.open();

    var collection = db.collection('submitted_assignments');

    var document = {
      'studentId': widget.user['id'],
      'assignmentId': widget.assignment['_id'],
      'id': fileId,
    };

    await collection.insertOne(document);
    var assignment = db.collection('assignment');
    await assignment.updateOne(
      mongo.where.eq('_id', widget.assignment['_id']),
      mongo.modify.push('submittedStudents', widget.user['id']),
    );

    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar('FileUpload', '', widget.user),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _chooseFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(154, 255, 240, 182),
                  ),
                  child: const Text(
                    'Choose File',
                    style: TextStyle(color: Color.fromARGB(255, 96, 49, 49)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _uploadFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(154, 255, 240, 182),
                  ),
                  child: const Text(
                    'Upload File',
                    style: TextStyle(color: Color.fromARGB(255, 96, 49, 49)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Upload Result: $_uploadResult',
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}
