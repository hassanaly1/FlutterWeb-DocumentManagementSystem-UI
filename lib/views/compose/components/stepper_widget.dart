import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/date_selection.dart';
import 'package:document_management_web/views/compose/components/document_selection.dart';
import 'package:document_management_web/views/compose/components/question_selection.dart';
import 'package:document_management_web/views/compose/components/review.dart';
import 'package:document_management_web/views/compose/components/user_data_table.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  StepperWidgetState createState() => StepperWidgetState();
}

class StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  final List<bool> _completedSteps = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Stepper(
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
        connectorThickness: 3.0,
        connectorColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => AppAssets.primaryColor,
        ),
        type: StepperType.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        steps: [
          Step(
            isActive: _currentStep >= 0,
            label: CustomTextWidget(text: 'User Selection'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.transparent,
              padding: const EdgeInsets.all(16.0),
              child: const UserDataTable(),
            ),
          ),
          Step(
            isActive: _currentStep >= 1,
            label: CustomTextWidget(text: 'Document Selection'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical, child: DocumentForm()),
            ),
          ),
          Step(
            isActive: _currentStep >= 2,
            label: CustomTextWidget(text: 'Question Selection'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const QuestionnaireForm(),
            ),
          ),
          Step(
            isActive: _currentStep >= 3,
            label: CustomTextWidget(text: 'Date Selection'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 4 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const DueDateAndRemindersForm(),
            ),
          ),
          Step(
            isActive: _currentStep >= 4,
            label: CustomTextWidget(text: 'Review'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 5 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const ReviewScreen(),
            ),
          ),
        ],
        currentStep: _currentStep,
      ),
    );
  }
}
