import 'package:document_management_web/views/compose/components/date_selection.dart';
import 'package:document_management_web/views/compose/components/document_selection.dart';
import 'package:document_management_web/views/compose/components/review.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTemplateStepperWidget extends StatefulWidget {
  const AddTemplateStepperWidget({super.key});

  @override
  _AddTemplateStepperWidgetState createState() =>
      _AddTemplateStepperWidgetState();
}

class _AddTemplateStepperWidgetState extends State<AddTemplateStepperWidget> {
  int _currentStep = 0;
  final List<bool> _completedSteps = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep--;
          });
        }
      },
      onStepContinue: () {
        setState(() {
          _completedSteps[_currentStep] = true;
          if (_currentStep < _completedSteps.length - 1) {
            _currentStep++;
          }
        });
      },
      controlsBuilder: (context, details) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(buttonText: 'BACK', onTap: details.onStepCancel!),
            CustomButton(buttonText: 'NEXT', onTap: details.onStepContinue!),
          ],
        );
      },
      connectorThickness: 5.0,
      elevation: 20.0,
      type: StepperType.horizontal,
      steps: [
        Step(
          isActive: _currentStep >= 0,
          label: CustomTextWidget(text: 'Document Selection'),
          title: CustomTextWidget(text: ''),
          state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
          content: Container(
            height: context.height * 0.56,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: const DocumentForm(),
          ),
        ),
        Step(
          isActive: _currentStep >= 1,
          label: CustomTextWidget(text: 'Question Selection'),
          title: CustomTextWidget(text: ''),
          state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
          content: Container(
            height: context.height * 0.56,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: const DueDateAndRemindersForm(),
          ),
        ),
        Step(
          isActive: _currentStep >= 2,
          label: CustomTextWidget(text: 'Review'),
          title: CustomTextWidget(text: ''),
          state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
          content: Container(
            height: context.height * 0.56,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: const ReviewScreen(),
          ),
        ),
      ],
      currentStep: _currentStep,
    );
  }
}
