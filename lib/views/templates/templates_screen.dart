import 'package:document_management_web/views/templates/custom_templates.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplateScreen extends StatelessWidget {
  TemplateScreen({Key? key}) : super(key: key);

  // Define a list of template data (you can replace this with your actual data)
  final List<Map<String, String>> templates = [
    {'name': 'Template 1'},
    {'name': 'Template 2'},
    {'name': 'Template 3'},
    {'name': 'Template 1'},
    {'name': 'Template 2'},
    {'name': 'Template 3'},
    {'name': 'Template 1'},
    {'name': 'Template 2'},
    {'name': 'Template 3'},
    {'name': 'Template 1'},
    {'name': 'Template 2'},
    {'name': 'Template 3'},
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
                child: Card(
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
                                fWeight: FontWeight.w700,
                              ),
                              CustomButton(
                                width: context.width * 0.1,
                                buttonText: 'Add Template',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        // Use ListView.builder to display template list
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: templates.length,
                          itemBuilder: (context, index) {
                            final template = templates[index];
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () => Get.to(const CustomTemplates(),
                                      transition: Transition.rightToLeft),
                                  leading: const Icon(Icons.edit_document),
                                  title: CustomTextWidget(
                                      text: template['name'] ?? ''),
                                  trailing: Wrap(
                                    children: [
                                      CustomButton(
                                        width: context.width * 0.1,
                                        buttonText: 'Edit',
                                        onTap: () {},
                                      ),
                                      CustomButton(
                                        width: context.width * 0.1,
                                        buttonText: 'Delete',
                                        buttonColor: Colors.red,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider()
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
