import 'dart:io';

import 'package:ezedu/models/student.dart';
import 'package:ezedu/screens/student/profile/student_profile_viewmodel.dart';
import 'package:ezedu/screens/student/tab/student_tab.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentProfileBody extends StatefulWidget {
  StudentProfileBody({this.student});
  Student? student;

  @override
  State<StudentProfileBody> createState() => _StudentProfileBodyState();
}

class _StudentProfileBodyState extends State<StudentProfileBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.student!.name);
    phoneController = TextEditingController(text: widget.student!.phone);
    addressController = TextEditingController(text: widget.student!.address);
    genderController = TextEditingController(text: widget.student!.gender);
    levelController = TextEditingController(text: widget.student!.level);
    
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentProfileViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentProfileViewModel(),
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
                            image: AssetImage('assets/images/user.png'))),
                  ),
                  /*Positioned(
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
                      ))*/
                ])),
                const SizedBox(height: 15),
                Text(
                  model.currentStudent.name,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'nama saya',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      labelText: 'Phone',
                      labelStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'no saya',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                      labelText: 'Address',
                      labelStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'address saya',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: genderController,
                  decoration: const InputDecoration(
                      labelText: 'Gender',
                      labelStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'gender saya',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: levelController,
                  decoration: const InputDecoration(
                      labelText: 'Form',
                      labelStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'form saya',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //height: 50,
                        padding: const EdgeInsets.only(bottom: 40),
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => StudentTab()));
                            },
                            style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              'CANCEL',
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black),
                            )),
                      ),
                      Container(
                          //height: 50,
                          padding: const EdgeInsets.only(bottom: 40),
                          child: ElevatedButton(
                              onPressed: () async {
                                model.updateStudent(
                                  id: model.currentStudent.id,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                  level: levelController.text,
                                  gender: genderController.text,
                                );

                                await Future.delayed(Duration(seconds: 1));

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => StudentTab()));
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                'SAVE',
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.black),
                              ))),
                    ],
                  ),
                )
                //list of qualification cikgu tu
              ]),
            )));
  }
}
