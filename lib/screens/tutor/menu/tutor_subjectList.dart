import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_subjectList_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TutorSubjectList extends StatefulWidget {
  @override
  State<TutorSubjectList> createState() => _TutorSubjectList();
}

class _TutorSubjectList extends State<TutorSubjectList> {
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorSubjectListViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorSubjectListViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                backgroundColor: Colors.lightBlue[50],
                body: model.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : model.empty
                        ? Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: Text(
                                          'No Subject Offered To Student'))),
                            ],
                          )
                        : Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(padding),
                                  child: const Text(
                                    "Subject List",
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: model.subjectList == null
                                      ? 1
                                      : model.subjectList.length,
                                  itemBuilder: (context, index) {
                                    Subject subject = model.subjectList[index];

                                    return Container(
                                      //height: 50,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      padding: EdgeInsets.only(
                                          left: padding, right: padding),
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                            subject.subjectName,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          subtitle: Container(
                                            padding: const EdgeInsets.only(
                                                top: 4.0, bottom: 4.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'RM' +
                                                      subject
                                                          .subjectPrice
                                                          .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  subject.subjectDesc,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.5,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(height: 8.5),
                                                Row(
                                                  children: [
                                                    Text(
                                                      subject
                                                          .subjectSlot,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ))));
  }
}
