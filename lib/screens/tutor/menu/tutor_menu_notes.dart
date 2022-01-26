import 'package:flutter/material.dart';

class tutorNote extends StatefulWidget {
  @override
  State<tutorNote> createState() => _tutorNote();
}

class _tutorNote extends State<tutorNote> {
  bool _customTileExpanded = false;
  double padding = 5;

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
                  "Upload Note",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  Card(
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                minLines: 4,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Add new note..',
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.insert_link),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.image_outlined),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.videocam),
                                      onPressed: () {}),
                                  Expanded(
                                    child: Text(''),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Send")),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 30),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Select class group",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: DropdownButton<String>(
                                    items: <String>[
                                      'Mathematics',
                                      'Science',
                                      'Bahasa Malaysia',
                                      'English'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  )),
                              SizedBox(height: 50),

                              //add more stuff tu column
                            ],
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
