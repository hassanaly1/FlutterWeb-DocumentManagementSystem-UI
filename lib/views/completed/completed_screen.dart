import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        child: Center(child: CustomTextWidget(text: 'CompletedScreen')),
      ),
    );
  }
}