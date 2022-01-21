import 'package:flutter/material.dart';

void main() {
  runApp(tutorFeed());
}

class tutorFeed extends StatefulWidget {
  @override
  State<tutorFeed> createState() => _tutorFeed();
}

class _tutorFeed extends State<tutorFeed> {
  bool _customTileExpanded = false;
  double padding = 5;
  final List<String> feeds = [
    'Registered in ezedu',
    'Profile updated',
    'Testing',
    'Announcement',
    'Announcement',
    'Announcement',
    'Announcement',
    'Announcement',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.lightBlue[50],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: const Text(
                      "Feeds",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
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
                                  //add more stuff tu column
                                ],
                              )))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text(
                      "Feed history",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
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
                        itemCount: feeds.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                              child: ListTile(
                                title: Text(feeds[index]),
                                onTap: () {
                                  // print(days[index]);
                                },
                                // elevation: 50,
                              ),
                            )))
              ],
            ),
          ),
        ));
  }
}
