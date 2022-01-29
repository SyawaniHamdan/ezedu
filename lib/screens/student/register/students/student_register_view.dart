import 'package:ezedu/screens/student/register/students/student_register_viewmodel.dart';
import 'package:ezedu/screens/tutor/register/widgets/tutor_register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentRegistration extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => StudentRegistration());

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  String _name = '';
  String _phone = '';
  String _email = '';
  String _password = '';
  String _gender = '';
  String _address = '';
  String _level = '';

  get name => _name;
  set name(value) => setState(() => _name = value);

  get phone => _phone;
  set phone(value) => setState(() => _phone = value);

  get email => _email;
  set email(value) => setState(() => _email = value);

  get password => _password;
  set password(value) => setState(() => _password = value);

  get gender => _gender;
  set gender(value) => setState(() => _gender = value);

  get address => _address;
  set address(value) => setState(() => _address = value);

  get level => _level;
  set level(value) => setState(() => _level = value);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentRegisterViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentRegisterViewModel(),
        builder: (context, model, child) => Scaffold(
                body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00b8d4),
                            fontSize: 36),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration: const InputDecoration(labelText: "Name"),
                          controller: nameController,
                          onChanged: (value) => name = value),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Mobile Number"),
                          controller: phoneController,
                          onChanged: (value) => phone = value),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration: const InputDecoration(labelText: "Email"),
                          controller: emailController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.')) {
                              return ('Please enter a valid email address');
                            }
                          },
                          onChanged: (value) => email = value),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Password"),
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Password is empty'
                              : null,
                          onChanged: (value) => password = value),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Form'),
                          controller: levelController,
                          onChanged: (value) => level = value),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Gender'),
                          controller: genderController,
                          onChanged: (value) => gender = value),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Address'),
                          controller: addressController,
                          onChanged: (value) => address = value),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          model.signUp(
                            name: name,
                            email: email,
                            password: password,
                            phone: phone,
                            gender: gender,
                            address: address,
                            level: level,
                            context: context,
                            type: "Student",
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.teal,
                          primary: Colors.cyan[100],
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: LinearGradient(colors: [
                                Colors.lightBlue.shade900,
                                Colors.cyan.shade900
                              ])),
                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () => {model.navigateToSignIn(context)},
                        child: const Text(
                          "Already Have an Account? Sign in",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00b8d4)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
