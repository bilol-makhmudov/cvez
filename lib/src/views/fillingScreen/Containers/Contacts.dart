import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../blocs/bloc_barrel.dart';
import '../../../models/PersonalInfo.dart';

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
  final TextEditingController _addressFirstLineController =
      TextEditingController();
  final TextEditingController _addressSecondLineController =
      TextEditingController();

  void updateControllers(PersonalInfo state) {
    if (mounted) {
      _emailController.text = state.email;
      _phoneController.text = state.phoneNumber;
      _webController.text = state.website;
      _linkedInController.text = state.linkedIn;
      _instagramController.text = state.instagram;
      _twitterController.text = state.twitter;
      _addressFirstLineController.text = state.addressFirstLine;
      _addressSecondLineController.text = state.addressSecondLine;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final personalInfoBloc = context.read<PersonalInfoBloc>();
    personalInfoBloc.stream.listen((state) {
      if (state is PersonalInfoLoadSuccess) {
        updateControllers(state.personalInfo);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _webController.dispose();
    _linkedInController.dispose();
    _instagramController.dispose();
    _twitterController.dispose();
    _addressFirstLineController.dispose();
    _addressSecondLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
      if (state is PersonalInfoLoadSuccess) {
        updateControllers(state.personalInfo);
      }
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
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
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
                              .read<PersonalInfoBloc>()
                              .personalInfo
                              .copyWith(phoneNumber: value)));
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
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
                              .read<PersonalInfoBloc>()
                              .personalInfo
                              .copyWith(website: value)));
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
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
                              .read<PersonalInfoBloc>()
                              .personalInfo
                              .copyWith(linkedIn: value)));
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
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
                              .read<PersonalInfoBloc>()
                              .personalInfo
                              .copyWith(instagram: value)));
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
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
                              .read<PersonalInfoBloc>()
                              .personalInfo
                              .copyWith(twitter: value)));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _addressFirstLineController,
                    decoration: InputDecoration(hintText: "Address 1st line"),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
                              .read<PersonalInfoBloc>()
                              .personalInfo
                              .copyWith(addressFirstLine: value)));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _addressSecondLineController,
                    decoration: InputDecoration(hintText: "Address 2nd line"),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                          context
                              .read<PersonalInfoBloc>()
                              .personalInfo
                              .copyWith(addressSecondLine: value)));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
