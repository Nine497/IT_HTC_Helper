import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:htc_helper/profile.dart';
import 'package:htc_helper/chat.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: Colors.white.withOpacity(0.0), //ทำให้กล่องนี้ใส
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
                child: Text('Login Screen',
                    style: GoogleFonts.acme(fontSize: 50, color: Colors.white)),
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
                                onPressed: () {
                                  formkey.currentState?.save();
                                  print(
                                      "email = ${profile.email} password = ${profile.password}");
                                  formkey.currentState?.reset();
                                },
                                child: Text('Login',
                                    style: GoogleFonts.acme(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]))));
  }
}
