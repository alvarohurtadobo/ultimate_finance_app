import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'SimpleRawButton', type: ElevatedButton)
Widget simpleButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        print('Pressed');
      },
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%2Fid%2FOIP.qrUxkOgHR_lEAn-YMUM_JQAAAA%3Fcb%3D12%26pid%3DApi&f=1&ipt=3eb8025441bd75ccd0c6c9cbf391c00ac4c63f720727a5565f7daf2d8a85912f',
        ),
        radius: 30,
        backgroundColor: Colors.green,
        child: Text(
          context.knobs.string(label: 'name', initialValue: 'Alvaro Hurtado'),
        ),
      ),
    ),
  );
}
