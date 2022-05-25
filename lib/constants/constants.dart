import 'package:flutter/material.dart';

var color = Colors.blueAccent;

var kTextFieldDecoration = InputDecoration(
  labelText: 'Email',
  hintText: 'Enter a value',
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 1.0),
    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
