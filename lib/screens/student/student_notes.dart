import 'package:flutter/material.dart';

void main() {
  runApp(StudentNote());
}

class StudentNote extends StatefulWidget {
  @override
  State<StudentNote> createState() => _StudentNote();
}

class _StudentNote extends State<StudentNote> {
  final subject = ['Mathematics', 'Additional Mathematics', 'Biology'];
  final tutor = ['Lisa Manoban', 'Jennie Jane', 'Rose Khan'];
  bool _customTileExpanded = false;
  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: const Text(
                  "Lecture Notes",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: tutor.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            backgroundColor: Colors.white,
                            title: Text(tutor[index]),
                            subtitle: Text(subject[index]),
                            children: const [
                              ListTile(
                                title: Text("Notes Example"),
                              )
                            ],
                          )
                        ],
                      ));
                    })),
          ],
        ),
      ),
    );
  }
}
