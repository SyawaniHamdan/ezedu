import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TutorProfileBody extends StatefulWidget {
  @override
  State<TutorProfileBody> createState() => _TutorProfileBodyState();
}

class _TutorProfileBodyState extends State<TutorProfileBody> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorProfileViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorProfileViewModel(),
        // onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(children: <Widget>[
                Center(
                    child: Stack(children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/logo_ezEdu.png'),
                        )),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          color: Colors.lightBlue,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ))
                ])),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  model.currentTutor.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'About',
                      labelStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'show about tutor',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 16),

                //list of qualification cikgu tu
              ]),
            )));
  }
}
