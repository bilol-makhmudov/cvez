import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryContainer extends StatefulWidget {
  const SummaryContainer({super.key});

  @override
  State<SummaryContainer> createState() => _SummaryContainerState();
}

class _SummaryContainerState extends State<SummaryContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              expands: true,
              maxLines: null,
              minLines: null,
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
  }
}
