import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:htc_helper/profile.dart';
import 'package:htc_helper/chat.dart';
import 'package:htc_helper/main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TeacherLogin extends StatefulWidget {
  const TeacherLogin({super.key});

  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"), // ignore: prefer_const_constructors
              ),
              body: Center(child: Text("${snapshot.error}")),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF041B3A),
                      Color(0xFF3A8EFF),
                    ],
                  ), //ตกแต่งสีพื้นหลัง
                ),
                child: Scaffold(
                    backgroundColor:
                        Colors.white.withOpacity(0.0), //ทำให้กล่องนี้ใส
                    body: SafeArea(
                        child: Column(children: [
                      Container(
                        child: SizedBox(height: 50),
                      ), //สร้างกล่องให้ Logo ไม่ติดด้านบนจอ

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/img/Logo.png',
                                height: 130), //ใส่รูป Logo
                          ],
                        ),
                      ),
                      Container(
                        child: SizedBox(height: 30),
                      ),
                      Container(
                        child: Text('Teacher Login',
                            style: GoogleFonts.acme(
                                fontSize: 50, color: Colors.white)),
                      ),
                      Container(
                        child: SizedBox(height: 30),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formkey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Enter Your E-mail',
                                      style: GoogleFonts.acme(
                                          fontSize: 20, color: Colors.white)),
                                  TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText:
                                              "Plase Enter your email !"),
                                      EmailValidator(
                                          errorText:
                                              "Please enter correct email format !")
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (String? email) {
                                      profile.email = email;
                                    },
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text('Enter Your Password',
                                      style: GoogleFonts.acme(
                                          fontSize: 20, color: Colors.white)),
                                  TextFormField(
                                    validator: RequiredValidator(
                                        errorText:
                                            "Plase Enter your password !"),
                                    obscureText: true,
                                    onSaved: (String? password) {
                                      profile.password = password;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (formkey.currentState!
                                              .validate()) {
                                            formkey.currentState?.save();
                                            try {
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email: profile.email!,
                                                      password:
                                                          profile.password!)
                                                  .then((value) {
                                                formkey.currentState?.reset();
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return Chat();
                                                }));
                                              });
                                            } on FirebaseException catch (e) {
                                              Fluttertoast.showToast(
                                                  msg: e.message!,
                                                  gravity: ToastGravity.CENTER);
                                            }
                                          }
                                        },
                                        child: Text('Login',
                                            style: GoogleFonts.acme(
                                                fontSize: 20,
                                                color: Colors.white))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 40.0,
                          width: 100.0,
                          child: Material(
                            color: Colors.lightBlue,
                            elevation: 8,
                            borderRadius: BorderRadius.circular(28),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              splashColor: Colors.black26,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyApp()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Ink.image(
                                    image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Back_Arrow.svg/1024px-Back_Arrow.svg.png'),
                                    height: 25,
                                    width: 25,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  )
                                ],
                              ),
                            ),
                          )),
                    ]))));
          }
          return SizedBox.shrink();
        });
  }
}
