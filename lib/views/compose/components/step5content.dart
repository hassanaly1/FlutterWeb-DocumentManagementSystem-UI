import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step5Content extends StatefulWidget {
  const Step5Content({
    super.key,
  });

  @override
  State<Step5Content> createState() => _Step5ContentState();
}

class _Step5ContentState extends State<Step5Content> {
  double containerHeight = 100.0;

  void toggleContainerHeight() {
    setState(() {
      containerHeight = containerHeight == 300.0 ? 100.0 : 300.0;
    });
  }

  List<Map<String, dynamic>> usersData = [
    {"name": "Andrew", "email": "andrew@gmail.com"},
    {"name": "Alice", "email": "alice@gmail.com"},
    {"name": "Bob", "email": "bob@gmail.com"},
  ];

  List<Map<String, dynamic>> documentsData = [
    {"name": "Birth Certificate", "type": "PDF"},
    {"name": "Passport", "type": "JPG"},
    {"name": "Resume", "type": "Doc"},
  ];

  List<Map<String, dynamic>> questionnairesData = [
    {
      "question": "What is the expiry date of certificate?",
      "options": ["PDF", "Doc", "Image", "Other"],
    },
    {
      "question": "Which format is preferred?",
      "options": ["PDF", "Doc", "Image"],
    },
    {
      "question": "Additional comments?",
      "options": ["Text", "Audio", "None"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, border: Border.all(color: Colors.black)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                width: context.width * 0.8,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Users',
                      fSize: 20,
                      fWeight: FontWeight.w700,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: usersData.length,
                      itemBuilder: (context, index) {
                        final user = usersData[index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: CustomTextWidget(
                              text: '\u2022',
                              fWeight: FontWeight.bold,
                            ),
                            title: CustomTextWidget(text: user["name"]),
                            subtitle: CustomTextWidget(
                              text: user["email"],
                              fSize: 12,
                            ),
                            trailing: CustomButton(
                              width: context.width * 0.1,
                              buttonText: 'Remove',
                              buttonColor: Colors.red,
                              onTap: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                width: context.width * 0.8,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Documents',
                      fSize: 20,
                      fWeight: FontWeight.w700,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: documentsData.length,
                      itemBuilder: (context, index) {
                        final document = documentsData[index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: CustomTextWidget(
                              text: '\u2022',
                              fWeight: FontWeight.bold,
                            ),
                            title: CustomTextWidget(text: document["name"]),
                            subtitle: CustomTextWidget(
                              text: document["type"],
                              fSize: 12,
                            ),
                            trailing: CustomButton(
                              width: context.width * 0.1,
                              buttonText: 'Remove',
                              buttonColor: Colors.red,
                              onTap: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                width: context.width * 0.8,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Questionnaires',
                      fSize: 20,
                      fWeight: FontWeight.w700,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: questionnairesData.length,
                      itemBuilder: (context, index) {
                        final questionnaire = questionnairesData[index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: CustomTextWidget(
                              text: '\u2022',
                              fWeight: FontWeight.bold,
                            ),
                            title: CustomTextWidget(
                                text: questionnaire["question"]),
                            subtitle: SizedBox(
                              height: 50, // Set a suitable height
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: questionnaire["options"].length,
                                itemBuilder: (context, index) {
                                  final option =
                                      questionnaire["options"][index];
                                  return Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      const Icon(Icons.arrow_right_rounded),
                                      const SizedBox(width: 10),
                                      CustomTextWidget(
                                        text: option,
                                        fSize: 12,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            trailing: CustomButton(
                              width: context.width * 0.1,
                              buttonText: 'Remove',
                              buttonColor: Colors.red,
                              onTap: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                width: context.width * 0.8,
                height: context.height * 0.2,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Due Date',
                      fSize: 20,
                      fWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(
                      text: '17-11-2023',
                      fSize: 14,
                      fWeight: FontWeight.w300,
                    ),
                    const Divider(),
                    CustomTextWidget(
                      text: 'Reminders',
                      fSize: 20,
                      fWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(
                      text: '18-11-2023',
                      fSize: 14,
                      fWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
