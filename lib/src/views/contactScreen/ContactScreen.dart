import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/Email.dart';
import '../../services/emailSender.dart';

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
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Contact",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: "Outfit"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/contact.png",
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: screenHeight * 0.5,
                    width: screenWidth,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Contact Us",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Name",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _emailController,
                            decoration: InputDecoration(
                                hintText: "Your email",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _messageController,
                              expands: true,
                              maxLines: null,
                              minLines: null,
                              decoration:  InputDecoration(
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
                                  borderRadius: BorderRadius.circular(12.0),
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

                              if(_nameController.text.isNotEmpty && _emailController.text.isNotEmpty && _messageController.text.isNotEmpty){

                                if(EmailValidator.validate(_emailController.text)){
                                  await emailSender(emailToSend);

                                  _showMessage(context, 'Feedback sent successfully!');
                                  Navigator.pop(context);
                                } else {
                                  _showMessage(context, 'Please enter a valid e-mail address!');
                                }

                              } else {
                                _showMessage(context, 'Please enter the your name, e-mail and message!');
                              }

                            } catch (e) {
                              print("Error: $e");
                            }

                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12)),
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
            ],
          ),
        ),
      ),
    );
  }
}

void _showMessage(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(message)),
  );
}
