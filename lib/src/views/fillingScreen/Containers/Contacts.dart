import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../blocs/bloc_barrel.dart';

class ContactsContainer extends StatefulWidget {
  const ContactsContainer({super.key});

  @override
  State<ContactsContainer> createState() => _ContactsContainerState();
}

class _ContactsContainerState extends State<ContactsContainer> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _webController = TextEditingController();
  final TextEditingController _linkedInController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  final TextEditingController _addressFirstLine = TextEditingController();
  final TextEditingController _addressSecondLine = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInfoBloc(),
      child: BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Personal Information",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(hintText: "Email"),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(hintText: "Phone"),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _webController,
                          decoration: InputDecoration(hintText: "Website"),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _linkedInController,
                          decoration: InputDecoration(hintText: "Linkedin"),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _instagramController,
                          decoration: InputDecoration(hintText: "Instagram"),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _twitterController,
                          decoration: InputDecoration(hintText: "Twitter"),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _addressFirstLine,
                          decoration:
                              InputDecoration(hintText: "Address 1st line"),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _addressSecondLine,
                          decoration:
                              InputDecoration(hintText: "Address 2nd line"),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            context.read<PersonalInfoBloc>().add(
                                PersonalInfoUpdated(context
                                    .read<PersonalInfoBloc>()
                                    .personalInfo
                                    .copyWith(email: value)));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
