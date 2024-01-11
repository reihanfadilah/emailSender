import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:emailsender/shared/widget/forms/custom_textfield_main.dart';
import 'package:flutter/material.dart';

import 'shared/widget/button/button_custom.dart';

class EmailSenderScreen extends StatefulWidget {
  const EmailSenderScreen({super.key});

  @override
  State<EmailSenderScreen> createState() => _EmailSenderScreenState();
}

class _EmailSenderScreenState extends State<EmailSenderScreen> {
  final controllerName = TextEditingController();
  final controllerToName = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();

  Future sendEmail(
    BuildContext context, {
    required String name,
    required String toName,
    required String subject,
    required String email,
    required String message,
  }) async {
    const serviceId = 'service_rbzf5vm';
    const templateId = 'template_69i0d5r';
    const userId = '9rW9lvRmrntBryVCx';
    const accessToken = 'qgabcTqdl_yg0s7TXpVHZ';

    final response = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'accessToken': accessToken,
        'template_params': {
          'to_email': email,
          'to_name': toName,
          'message': message,
          'from_name': name,
          'subject': subject,
        },
      }),
    );
    showSnackBar(
      response.statusCode == 200 ? "Success!" : "Error : ${response.body}",
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Email Sender'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFieldMain(label: 'Nama', controller: controllerName),
              CustomTextFieldMain(
                label: 'Nama Tujuan',
                controller: controllerToName,
              ),
              CustomTextFieldMain(
                label: 'Subject',
                controller: controllerSubject,
              ),
              CustomTextFieldMain(label: 'Email', controller: controllerEmail),
              CustomTextFieldMain(
                label: 'Message',
                controller: controllerMessage,
              ),
              const SizedBox(height: 16),
              ButtonCustom(
                label: 'Submit',
                onTap: () => sendEmail(
                  context,
                  name: controllerName.text,
                  toName: controllerToName.text,
                  subject: controllerSubject.text,
                  email: controllerEmail.text,
                  message: controllerMessage.text,
                ),
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
