import 'package:ezedu/screens/tutor/login/widgets/tutor_login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TutorLoginView extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => TutorLoginView());

  @override
  State<TutorLoginView> createState() => TutorLoginViewState();
}

class TutorLoginViewState extends State<TutorLoginView> {
  String _email = '';
  String _password = '';

  get email => _email;
  set email(value) => setState(() => _email = value);

  get password => _password;
  set password(value) => setState(() => _password = value);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorLoginViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorLoginViewModel(),
        // onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF006064),
                            fontSize: 36),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: "Email"),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return ('Please enter a valid email address');
                          }
                        },
                        onChanged: (value) => email = value,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Password"),
                          obscureText: true,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Password is empty'
                              : null,
                          onChanged: (value) => password = value),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          model.login(
                              email: email,
                              password: password,
                              context: context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors
                              .cyan[800], //change background color of button
                          onPrimary: Colors.white, //change text color of button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: 150,
                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            "LOGIN",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          model.navigateToRegister(context);
                        },
                        child: const Text(
                          "Don't Have an Account? Sign up",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB71C1C)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // floatingActionButton: ,
            ));
  }
}
