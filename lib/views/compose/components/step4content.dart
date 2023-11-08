import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DueDateAndRemindersScreen extends StatefulWidget {
  const DueDateAndRemindersScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DueDateAndRemindersScreenState createState() =>
      _DueDateAndRemindersScreenState();
}

class _DueDateAndRemindersScreenState extends State<DueDateAndRemindersScreen> {
  DateTime? selectedDueDate;
  List<DateTime> selectedReminderDates = [];

  Future<void> _selectDueDate() async {
    final pickedDueDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDueDate != null) {
      setState(() {
        selectedDueDate = pickedDueDate;
      });
    }
  }

  Future<void> _selectReminderDate() async {
    final pickedReminderDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedReminderDate != null) {
      setState(() {
        selectedReminderDates.add(pickedReminderDate);
      });
    }
  }

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
            ListTile(
              title: CustomTextWidget(
                text: 'Due Date',
                fSize: 16.0,
                fWeight: FontWeight.w700,
              ),
              subtitle: selectedDueDate != null
                  ? CustomTextWidget(
                      text:
                          'The due date for sending the documents is ${selectedDueDate!.day.toString()}-${selectedDueDate!.month.toString()}-${selectedDueDate!.year.toString()}')
                  : CustomTextWidget(text: 'No Due Date selected'),
              trailing: CustomButton(
                  width: context.width * 0.15,
                  buttonText: 'Select Due Date',
                  onTap: _selectDueDate),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Reminder Dates',
                    fSize: 16.0,
                    fWeight: FontWeight.w700,
                  ),
                  CustomTextWidget(
                    text:
                        'The Client will get reminders through email and phone number on the dates you will select below.',
                    fSize: 12.0,
                    fWeight: FontWeight.w400,
                  ),
                ],
              ),
              subtitle: selectedReminderDates.isNotEmpty
                  ? Column(
                      children: List.generate(
                      selectedReminderDates.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 5.0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CustomTextWidget(
                                text:
                                    'Reminder ${(index + 1)} at ${selectedReminderDates[index].day.toString()}-${selectedReminderDates[index].month.toString()}-${selectedReminderDates[index].year.toString()}',
                              ),
                            ),
                          ),
                          const CustomTextField(
                              hintText: 'Enter message',
                              fillColor: Colors.white)
                        ],
                      ),
                    ))
                  // children: selectedReminderDates
                  //     .map((date) => CustomTextWidget(
                  //         text:
                  //             'Reminder $date is ${date.day.toString()}-${date.month.toString()}-${date.year.toString()}'))
                  //     .toList(),

                  : Center(
                      child: CustomTextWidget(
                          text: 'No dates for reminder selected')),
              mouseCursor: MaterialStateMouseCursor.clickable,
              trailing: CustomButton(
                  width: context.width * 0.15,
                  buttonText: 'Select Reminders Date',
                  onTap: _selectReminderDate),
            ),
          ],
        ),
      ),
    );
  }
}
