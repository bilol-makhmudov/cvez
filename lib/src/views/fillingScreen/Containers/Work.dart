import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/workExperience.dart';

class WorkContainer extends StatefulWidget {
  const WorkContainer({super.key});

  @override
  State<WorkContainer> createState() => _WorkContainerState();
}

class _WorkContainerState extends State<WorkContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your work experience",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "It is good practice to add last 2 or more work experiences",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (() {
                  showAddWorkExperience(context);
                }),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add work experience",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
