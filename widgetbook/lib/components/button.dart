import 'package:flutter/material.dart';
import 'package:ultimate_finance_app/feature/wallet/presentation/widgets/button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';


@UseCase(name: 'SimpleRawButton', type: CustomButton)
Widget simpleButton(BuildContext context) {
  return Center(
    child: CustomButton(
      name: context.knobs.string(label: 'name', initialValue: 'Alvaro Hurtado'),
    ),
  );
}