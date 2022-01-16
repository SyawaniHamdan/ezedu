import 'package:ez_edu/templates/templateCallTabBody.dart';
import 'package:ez_edu/templates/templateList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const templateMenu());
}

class templateMenu extends StatelessWidget {
  const templateMenu({Key? key}) : super(key: key);
  static const primaryColor =
      Color.fromARGB(255, 28, 100, 196); //BACKGROUNDCOLOR
  static const secondaryColor =
      Color.fromARGB(255, 255, 0, 0); //INDICATOR COLOR
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: Row(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      'https://i.pinimg.com/474x/76/94/84/769484dafbe89bf2b8a22379658956c4.jpg',
                      height: 50,
                      width: 50)),
              Text("  "),
              Text("ALI BABA"),

              //STAR RATING FOR LECT
            ]),
            backgroundColor: primaryColor,
            bottom: const TabBar(
              indicatorColor: secondaryColor,
              tabs: [
                // FOR TEACHER
                Tab(icon: Icon(Icons.dynamic_feed)),
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.wc)),
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.payments)),

                //FOR STUDENT
                /*
                Tab(icon: Icon(Icons.view_list)),
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.class_)),
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.payments)),
                */
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: TabBarView(
            children: [
              //CALL THE CALSS FROM ANOTHER SCRIPT TO DISPLAY STUFF
              new templatePlain(), //refet to this script to edit

              new templateList(),

              Text(
                'student list',
                style: TextStyle(fontSize: 21),
              ),
              Text(
                'chat',
                style: TextStyle(fontSize: 21),
              ),
              Text(
                'payment',
                style: TextStyle(fontSize: 21),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
