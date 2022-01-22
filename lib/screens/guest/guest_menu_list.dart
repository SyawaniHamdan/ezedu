import 'package:ezedu/screens/student/home/student_home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class GuestList extends StatefulWidget {
  const GuestList({Key? key}) : super(key: key);

  @override
  State<GuestList> createState() => _GuestList();
}

class _GuestList extends State<GuestList> {
  // mock data
  final subject = ['Science', 'Physics', 'English'];
  final tutor = ['Joseph Ng', 'Azalina Harun', 'Priyanka Chopra'];
  final rating = [4.2, 4.3, 3.5];
  final location = [
    'Johor Bahru, Johor',
    'Pasir Mas, Kelantan',
    'Subang Jaya, Selangor'
  ];

  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentHomeViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentHomeViewModel(),
        builder: (context, model, child) => Scaffold(
              //appbar
              backgroundColor: Colors.lightBlue[50],
              body: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: const Text(
                        "Classes List",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: tutor.length,
                        itemBuilder: (context, index) {
                          return Container(
                            //height: 50,
                            width: MediaQuery.of(context).size.width - 100,
                            padding:
                                EdgeInsets.only(left: padding, right: padding),
                            child: Card(
                              child: ListTile(
                                title: Text(subject[index]),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(tutor[index]),
                                    RatingBar.builder(
                                      initialRating: rating[index],
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    Text(location[index]),
                                    //Text(subtitle[index]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ));
  }
}
