import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionnaireForm extends StatefulWidget {
  const QuestionnaireForm({super.key});

  @override
  _QuestionnaireFormState createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<QuestionnaireForm> {
  List<Question> questions = [];
  String selectedAnswerType = 'Checkbox';
  TextEditingController questionTextController = TextEditingController();
  List<String> answerOptions = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: context.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, border: Border.all(color: Colors.black)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Question Input
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    fillColor: Colors.white,
                    hintText: 'Enter Question',
                    controller: questionTextController,
                  ),
                  // TextFormField(
                  //   controller: questionTextController,
                  //   decoration: const InputDecoration(labelText: 'Question Text'),
                  //   onChanged: (value) {
                  //     questions.last.text = value;
                  //   },
                  // ),

                  // Answer Type Dropdown
                  Container(
                    height: 50.0,
                    width: context.width * 0.2,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Colors.white,
                    child: Center(
                      child: DropdownButton<String>(
                        alignment: Alignment.center,
                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        //elevation: 10,
                        value: selectedAnswerType,
                        items: [
                          'Checkbox',
                          'Yes/No',
                          'Radio Button',
                          'Text Field'
                        ].map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: CustomTextWidget(text: type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedAnswerType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Answer Options (for Checkbox and Radio Button)
            if (selectedAnswerType == 'Checkbox' ||
                selectedAnswerType == 'Radio Button')
              Column(
                children: [
                  CustomTextWidget(text: 'Answer Options'),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: answerOptions.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                                border: InputBorder.none,
                                hintText:
                                    'Enter Answer ${(index + 1).toString()}',
                              ),
                              onChanged: (value) {
                                answerOptions[index] = value;
                                questions.last.answerOptions = answerOptions;
                              },
                            ),
                          ),
                        ),
                      );

                      // return TextFormField(
                      //   onChanged: (value) {
                      //     answerOptions[index] = value;
                      //     questions.last.answerOptions = answerOptions;
                      //   },
                      // );
                    },
                  ),
                  CustomButton(
                    width: context.width * 0.1,
                    buttonText: 'Add Options',
                    onTap: () {
                      setState(() {
                        answerOptions.add('');
                      });
                    },
                  ),
                ],
              ),
            if (selectedAnswerType == 'Text Field')
              const CustomTextField(
                  hintText: 'Enter Text Limit', fillColor: Colors.white),

            // Add More Question Button
            const Divider(),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  width: context.width * 0.1,
                  buttonText: 'Add Question',
                  onTap: () {
                    setState(() {
                      questions.add(Question(
                        text: '',
                        answerType: selectedAnswerType,
                        answerOptions: answerOptions,
                      ));
                      // Clear input fields
                      questionTextController.clear();
                      answerOptions = [];
                    });
                  },
                ),
                // Submit Button
                CustomButton(
                  width: context.width * 0.1,
                  buttonText: 'Submit',
                  onTap: () {
                    navigateToNextScreen(questions);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void navigateToNextScreen(List<Question> submittedQuestions) {
    // Navigate to the next screen and pass the submitted questions as needed.
    // You can use Navigator to push a new route with the submitted data.
  }
}

class Question {
  String text;
  String answerType;
  List<String> answerOptions;

  Question({
    required this.text,
    required this.answerType,
    this.answerOptions = const [],
  });
}
