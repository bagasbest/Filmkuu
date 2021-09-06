import 'package:flutter/material.dart';

class MoviesSearchScreen extends StatefulWidget {
  @override
  _MoviesSearchScreenState createState() => _MoviesSearchScreenState();
}

class _MoviesSearchScreenState extends State<MoviesSearchScreen> {
  var _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF060E3E),
      appBar: AppBar(
        backgroundColor: Color(0xFF060E3E),
        title: Text(
          'Cari Film',
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 16, right: 16),
              padding: EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _nameController,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Judul Film',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
