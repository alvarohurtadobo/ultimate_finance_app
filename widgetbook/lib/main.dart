import 'package:flutter/material.dart';
import 'package:widget_catalog/main.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
// import 'package:ultimate_finance_app/feature/wallet/presentation/widgets/button.dart';

void main() {
  runApp(const MainApp());
}

@App()
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        ViewportAddon([
          Viewports.none,
          IosViewports.iPad,
          IosViewports.iPhone12ProMax,
        ]),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
          ],
        ),
      ],
    );
  }
}
