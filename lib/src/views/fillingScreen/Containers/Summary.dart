import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/PersonalInfo.dart';

class SummaryContainer extends StatefulWidget {
  const SummaryContainer({super.key});

  @override
  State<SummaryContainer> createState() => _SummaryContainerState();
}

class _SummaryContainerState extends State<SummaryContainer> {
  TextEditingController _summaryController = TextEditingController();

  void updateControllers(PersonalInfo state) {
    if (mounted) {
      _summaryController.text = state.summary;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
      if (state is PersonalInfoLoadSuccess) {
        updateControllers(state.personalInfo);
      }
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  "Final part before generating your CV",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                TextButton(
                  child: Text(
                    "Done",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: _summaryController,
                expands: true,
                maxLines: null,
                minLines: null,
                onChanged: (value) {
                  context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                      context
                          .read<PersonalInfoBloc>()
                          .personalInfo
                          .copyWith(summary: value)));
                },
                decoration: InputDecoration(
                  hintText: "Your summary goes here ....",
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
          ]),
        ),
      );
    });
  }
}
