import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TutorProfileFloat extends StatefulWidget {

  @override
  State<TutorProfileFloat> createState() => _TutorProfileFloatState();
}

class _TutorProfileFloatState extends State<TutorProfileFloat> {
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<TutorProfileViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorProfileViewModel(),
        // onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => FloatingActionButton(
              child: Icon(Icons.add),
              tooltip: 'Add a new qualification',
              onPressed: () {},
              )
  );
  }
}
