import 'package:flutter/material.dart';
import '../models/cat.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddCatScreen extends StatefulWidget {
  const AddCatScreen({Key? key}) : super(key: key);

  @override
  _AddCatScreenState createState() => _AddCatScreenState();
}

class _AddCatScreenState extends State<AddCatScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String title = '';
  // imageLink 변수 삭제
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newCat = Cat(
        id: DateTime.now().toString(),
        name: name,
        title: title,
        link: _image?.path ?? 'assets/images/default.png',
        likeCount: 0,
        replyCount: 0,
        created: DateTime.now(),
        replies: [],
      );
      Navigator.pop(context, newCat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 고양이 추가'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: '이름'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이름을 입력해주세요';
                }
                return null;
              },
              onSaved: (value) => name = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '제목'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '제목을 입력해주세요';
                }
                return null;
              },
              onSaved: (value) => title = value!,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('이미지 선택'),
            ),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.file(_image!, height: 200),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset('assets/images/default.png', height: 200),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}
