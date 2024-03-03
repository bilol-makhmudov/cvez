import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Email.dart';
import '../../services/emailSender.dart';
import '../homeScreen/HomeScreen.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight * 0.5,
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 0.1, color: Colors.black)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: _nameController,
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "Your email"),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      decoration: InputDecoration(
                        hintText: "Your message goes here ....",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() async {
                      try {
                        var senderPassword = 'jxta kdsp yypp ugsx';
                        var senderEmail = 'cv.ez.app@gmail.com';
                        var receiverEmail = 'acutmaxb@gmail.com';
                        var emailSubject =
                            'Feedback from ${_nameController.text}';
                        var emailBody = 'Name: ${_nameController.text}\n '
                            'Email: ${_emailController.text}\n'
                            'Message: ${_messageController.text}';

                        Email emailToSend = Email(
                          senderEmail: senderEmail,
                          senderPassword: senderPassword,
                          receiver: receiverEmail,
                          subject: emailSubject,
                          body: emailBody,
                          isHTML: false,
                        );

                        await emailSender(emailToSend);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Feedback sent successfully!')),
                        );
                      } catch (e) {}
                      Navigator.pop(context);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "Send",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
