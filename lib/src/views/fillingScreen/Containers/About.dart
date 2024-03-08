import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../blocs/bloc_barrel.dart';
import '../../../models/models.dart';

class AboutContainer extends StatefulWidget {
  AboutContainer({super.key});

  @override
  State<AboutContainer> createState() => _AboutState();
}

class _AboutState extends State<AboutContainer> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();
  Timer? _timer;
  File? _image;
  final picker = ImagePicker();

  void updateControllers(PersonalInfo state) {
    if (mounted) {
      _firstNameController.text = state.firstName;
      _lastNameController.text = state.lastName;
      _jobTitleController.text = state.jobTitle;
    }
  }

  @override
  void initState() {
    super.initState();
    final personalInfoBloc = context.read<PersonalInfoBloc>();
    personalInfoBloc.stream.listen((state) {
      if (state is PersonalInfoLoadSuccess) {
        updateControllers(state.personalInfo);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dynamic tooltip = _tooltipKey.currentState;
      tooltip?.ensureTooltipVisible();
    });
    _timer = Timer(const Duration(seconds: 2), () {
      final dynamic tooltip = _tooltipKey.currentState;
      tooltip?.deactivate();
    });
    _image = personalInfoBloc.personalInfo.personalPhoto != null
        ? personalInfoBloc.personalInfo.personalPhoto!
        : null;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _jobTitleController.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
      if (state is PersonalInfoLoadSuccess) {
        updateControllers(state.personalInfo);
      }
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Personal Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            if (_image == null)
              Tooltip(
                key: _tooltipKey,
                margin: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                textStyle: TextStyle(color: Colors.black),
                waitDuration: Duration.zero,
                showDuration: Duration(seconds: 2),
                message: "Click here to add photo from your gallery",
                child: InkWell(
                  onTap: (() {
                    showPhotoSource(context);
                  }),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 45,
                      child: Icon(
                        Icons.person_add_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            if (_image != null)
              InkWell(
                onTap: (() {
                  showPhotoSource(context);
                }),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipOval(
                          child: Image(
                            image: FileImage(_image!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0, top: 100),
                        child: Icon(Icons.autorenew),
                      )
                    ],
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: _firstNameController,
                decoration: InputDecoration(hintText: "First name"),
                onChanged: (value) {
                  context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                      context
                          .read<PersonalInfoBloc>()
                          .personalInfo
                          .copyWith(firstName: value)));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: _lastNameController,
                decoration: InputDecoration(hintText: "Last name"),
                onChanged: (value) {
                  context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                      context
                          .read<PersonalInfoBloc>()
                          .personalInfo
                          .copyWith(lastName: value)));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: _jobTitleController,
                decoration: InputDecoration(hintText: "Job title"),
                onChanged: (value) {
                  context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                      context
                          .read<PersonalInfoBloc>()
                          .personalInfo
                          .copyWith(jobTitle: value)));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Fully filled CV looks better and higher chance of getting hired.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }

  Future showPhotoSource(context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null && mounted) {
      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(context
          .read<PersonalInfoBloc>()
          .personalInfo
          .copyWith(personalPhoto: File(pickedFile.path))));

      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(context
          .read<PersonalInfoBloc>()
          .personalInfo
          .copyWith(personalPhoto: File(pickedFile.path))));
    }
  }
}
