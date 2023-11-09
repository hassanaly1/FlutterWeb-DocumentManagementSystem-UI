import 'package:document_management_web/views/templates/components/add_template_stepper.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  final List<Map<String, String>> templates = [
    {
      'name': 'Business Report Template',
      'description': 'A template for creating professional business reports.'
    },
    {
      'name': 'Invoice Template',
      'description':
          'Generate invoices for your products and services with this template.'
    },
    {
      'name': 'Meeting Agenda Template',
      'description':
          'Plan and organize your meetings with this agenda template.'
    },
    {
      'name': 'Employee Handbook Template',
      'description': 'Create an employee handbook for your company policies.'
    },
    {
      'name': 'Product Catalog Template',
      'description': 'Build a catalog to showcase your products and services.'
    },
    {
      'name': 'Project Proposal Template',
      'description': 'Draft project proposals for clients or stakeholders.'
    },
    {
      'name': 'Resume Template',
      'description': 'Design a professional resume for job applications.'
    },
    {
      'name': 'Survey Form Template',
      'description': 'Craft surveys to gather valuable feedback and data.'
    },
    {
      'name': 'Legal Contract Template',
      'description': 'Create legally binding contracts for various purposes.'
    },
    {
      'name': 'Marketing Plan Template',
      'description': 'Develop marketing plans and strategies for your business.'
    },
    {
      'name': 'Expense Report Template',
      'description':
          'Track and report expenses incurred during business activities.'
    },
    {
      'name': 'Newsletter Template',
      'description': 'Design and send newsletters to your subscribers.'
    },
    {
      'name': 'Presentation Template',
      'description':
          'Prepare captivating presentations for meetings and events.'
    },
    {
      'name': 'Event Program Template',
      'description': 'Plan and outline the schedule for an upcoming event.'
    },
    {
      'name': 'Job Application Template',
      'description':
          'Simplify the job application process with this form template.'
    },
    {
      'name': 'Business Plan Template',
      'description':
          'Outline your business goals and strategies in a comprehensive plan.'
    },
    {
      'name': 'Travel Itinerary Template',
      'description': 'Organize travel plans and itineraries for trips.'
    },
    {
      'name': 'Recipe Book Template',
      'description':
          'Compile your favorite recipes into a personalized recipe book.'
    },
    {
      'name': 'Task List Template',
      'description': 'Keep track of tasks and to-do lists with this template.'
    },
    {
      'name': 'Family Budget Template',
      'description':
          'Manage and budget your family finances with this template.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                                text: 'Templates',
                                fSize: 20,
                                fWeight: FontWeight.w700),
                            CustomButton(
                                width: context.width * 0.1,
                                buttonText: 'Add Template',
                                onTap: () {
                                  _showDialog();
                                }),
                          ],
                        ),
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 1.3),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: templates.length,
                        itemBuilder: (context, index) {
                          final template = templates[index];
                          return Column(
                            children: [
                              Card(
                                elevation: 10.0,
                                child: Container(
                                  height: 200,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomTextWidget(
            text: "Add Template",
            fSize: 18.0,
            fWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: context.height * 0.85,
            width: context.width * 0.7,
            color: Colors.white,
            child: const AddTemplateStepperWidget(),
          ),
          // actions: [
          //   TextButton(
          //     child: CustomTextWidget(text: "Cancel"),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          //   TextButton(
          //     child: CustomTextWidget(text: "Save"),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}
