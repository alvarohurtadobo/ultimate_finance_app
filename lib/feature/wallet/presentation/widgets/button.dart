import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint('Pressed');
      },
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%2Fid%2FOIP.qrUxkOgHR_lEAn-YMUM_JQAAAA%3Fcb%3D12%26pid%3DApi&f=1&ipt=3eb8025441bd75ccd0c6c9cbf391c00ac4c63f720727a5565f7daf2d8a85912f',
        ),
        radius: 30,
        backgroundColor: Colors.green,
        child: Text(name),
      ),
    );
  }
}
