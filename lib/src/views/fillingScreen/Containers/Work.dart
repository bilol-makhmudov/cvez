import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/addExperience.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 0.2,
                            offset: Offset.fromDirection(2)),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Company name",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Position",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
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
              ),
            ],
          ),
        )),
      ),
    );
  }
}
