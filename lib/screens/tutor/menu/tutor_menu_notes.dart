import 'package:flutter/material.dart';

class tutorNote extends StatefulWidget {
  @override
  State<tutorNote> createState() => _tutorNote();
}

class _tutorNote extends State<tutorNote> {
  bool _customTileExpanded = false;
  double padding = 5;
  final List<String> subject = [
    'Biology',
    'Biology',
    'Biology',
    'Chemistry',
    'Biology',
    'Chemistry',
    'Chemistry'
  ];
  final List<String> note = [
    'Biology',
    'Biology',
    'Biology',
    'Chemistry',
    'Biology',
    'Chemistry',
    'Chemistry'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              height: 20.0,
            ),
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
            Container(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  Card(
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              const TextField(
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
                                  /*
                                  IconButton(
                                      icon: Icon(Icons.insert_link),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.image_outlined),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.videocam),
                                      onPressed: () {}),
                                      */
                                  const Expanded(
                                    child: Text(''),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Send")),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 30),
                              const Align(
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
                              SizedBox(height: 20),

                              //add more stuff tu column
                            ],
                          )))
                ],
              ),
            ),
            Container(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: padding),
                child: const Text(
                  "Sessions",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                //height: 1000,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: subject.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                          child: ListTile(
                            title: Column(children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(subject[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Note : ' + note[index]),
                              ),
                            ]),
                            onTap: () {
                              // print(days[index]);
                            },
                            // elevation: 50,
                          ),
                        )))
          ],
        )),
      ),
    );
  }
}
