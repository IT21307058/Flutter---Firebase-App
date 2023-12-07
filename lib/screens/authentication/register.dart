import 'package:firebase_auth_tutorial/constants/colors.dart';
import 'package:firebase_auth_tutorial/constants/description.dart';
import 'package:firebase_auth_tutorial/constants/styles.dart';
import 'package:firebase_auth_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //ref for the auth service class
  final AuthServices _auth = AuthServices();

  //from key
  final _formKey = GlobalKey<FormState>();

  //email password states
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          title: const Text(
            "REGISTER",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: bgBlack,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [
                const Text(
                  description,
                  style: descriptionStyle,
                ),
                Center(
                    child: Image.asset(
                  "assets/images/man.png",
                  height: 150,
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //email
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: textInputDecoration,
                            validator: (val) => val?.isEmpty == true
                                ? "Enter a valid Email"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          //password
                          TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: textInputDecoration.copyWith(
                                hintText: "Password"),
                            validator: (val) => val!.length < 6
                                ? "Enter a Valid password"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          //google
                          const SizedBox(height: 20),
                          //error text
                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                          const Text(
                            "Login with social accounts",
                            style: descriptionStyle,
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            //sing in with google
                            onTap: () {},
                            child: Center(
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 50,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          //register
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Do not have an account?",
                                style: descriptionStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                //go to the register page

                                onTap: () {
                                  widget.toggle();
                                },

                                child: const Text(
                                  "LOG IN",
                                  style: TextStyle(
                                      color: mainBlue,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                          //button
                          const SizedBox(height: 20),
                          GestureDetector(
                            //method for login user
                            onTap: () async {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                //error
                                setState(() {
                                  error = "Please enter a valid email";
                                });
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: bgBlack,
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 2, color: mainYellow)),
                              child: const Text(
                                "REGISTER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
