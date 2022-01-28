import 'package:ezedu/screens/student/chat/student_chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentChatBody extends StatefulWidget {
  @override
  State<StudentChatBody> createState() => _StudentChatBody();
}

class _StudentChatBody extends State<StudentChatBody> {
  // mock data
  final chat = ['Lisa manoban', 'Jennie Jane', 'Rose Khan', 'Jisoo Hae'];

  static const primaryColor = Color.fromARGB(255, 202, 201, 201);
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentChatViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentChatViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.lightBlue[50],
              body: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: const Text(
                        "Chat",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: chat.length,
                      itemBuilder: (context, index) {
                        return Container(
                          //height: 50,
                          width: MediaQuery.of(context).size.width - 100,
                          padding:
                              EdgeInsets.only(left: padding, right: padding),
                          child: Card(
                            child: ListTile(
                              title: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      'https://i.pinimg.com/474x/76/94/84/769484dafbe89bf2b8a22379658956c4.jpg',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(chat[index]),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
