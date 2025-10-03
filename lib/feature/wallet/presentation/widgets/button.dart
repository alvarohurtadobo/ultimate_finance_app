import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'SimpleRawButton', type: ElevatedButton)
Widget simpleButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      print('Pressed');
    },
    child: CircleAvatar(
      radius: 30,
      backgroundColor: Colors.green,
      child: Icon(Icons.person, color: Colors.white),
    ),
  );
}
