import 'package:flutter/material.dart';

void main() {
  runApp(templateList());
}

class templateList extends StatelessWidget {
  static const primaryColor = Color.fromARGB(255, 202, 201, 201);
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    final days = ['Sun', 'Mon', 'Tues'];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text(
                      "Notes",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      return Container(
                        //height: 50,
                        width: MediaQuery.of(context).size.width - 100,
                        padding: EdgeInsets.only(left: padding, right: padding),
                        child: Card(
                          child: ListTile(
                            title: Text(days[index]),
                            onTap: () {
                              print(days[index]);
                            },
                          ),
                        ),
                      );
                    },
                    /* FOR MAKING LINE BETWEEN LIST 
                       separatorBuilder: (context, index) {
                        return Divider();
                         },
                     */
                  ),
                ),

                //FOR MAKING LINE BETWEEN LIST return ListView.separated(
              ],
            )));
  }
}
