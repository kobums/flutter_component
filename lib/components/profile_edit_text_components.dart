import 'package:flutter/material.dart';

class ProfileEditTextComponents extends StatelessWidget {
  const ProfileEditTextComponents({Key? key, required this.editText})
      : super(key: key);

  final String editText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '수정',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(editText),
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(24, 14, 0, 0),
              hintStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
              hintText: editText,
              border: InputBorder.none,
              isDense: true,
              suffixIcon: const IconButton(
                icon: Icon(Icons.cancel),
                onPressed: null,
              ),
            ),
          ),
          const SizedBox(
            child: Divider(thickness: 2.0),
          ),
        ],
      ),
    );
  }
}
