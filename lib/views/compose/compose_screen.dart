import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/stepper_widget.dart';
import 'package:flutter/material.dart';

class ComposeScreen extends StatelessWidget {
  const ComposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: AppAssets.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0))),
        child: const StepperWidget(),
      ),
    );
  }
}
