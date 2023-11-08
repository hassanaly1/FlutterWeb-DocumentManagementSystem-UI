import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step2Content extends StatefulWidget {
  const Step2Content({super.key});

  @override
  _Step2ContentState createState() => _Step2ContentState();
}

class _Step2ContentState extends State<Step2Content> {
  List<Map<String, String>> documentList = [];
  List<TextEditingController> nameControllers = [];
  List<TextEditingController> typeControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers for text fields
    for (int i = 0; i < documentList.length; i++) {
      nameControllers.add(TextEditingController());
      typeControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: context.height * 0.42,
          width: context.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(
                color: Colors.grey,
              )),
          child: documentList.isEmpty
              ? Center(
                  child: CustomTextWidget(
                      text: 'Click on Add button to get started.'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: documentList.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(text: 'Document Name'),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  fillColor: Colors.white,
                                  controller: nameControllers[index],
                                  hintText: 'Document Name',
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(text: 'Document Type'),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  fillColor: Colors.white,
                                  controller: typeControllers[index],
                                  hintText: 'Document Type (.doc, .pdf...)',
                                ),
                              ],
                            ),
                          ],
                        ));
                  },
                ),
        ),
      ),
      const SizedBox(height: 5),
      CustomButton(
        buttonText: 'ADD',
        width: context.width * 0.1,
        onTap: () {
          setState(() {
            // Add a new row to the list and initialize controllers
            documentList.add({
              'documentName': '',
              'documentType': '',
            });
            nameControllers.add(TextEditingController());
            typeControllers.add(TextEditingController());
          });
        },
      ),
    ]));
  }
}
