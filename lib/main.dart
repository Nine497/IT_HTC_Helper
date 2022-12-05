import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:htc_helper/Student_Login.dart';
import 'package:htc_helper/chat.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'IT HTC Helper',
    theme: ThemeData(textTheme: GoogleFonts.acmeTextTheme()),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
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
                child: SizedBox(height: 70),
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
                child: SizedBox(height: 20),
              ),

              Container(
                child: Column(
                  children: [
                    Text(
                      'IT HTC Helper',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: SizedBox(height: 30),
              ),

              Container(
                child: Column(
                  children: [
                    Text(
                      'You are',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: SizedBox(height: 10),
              ),

              Container(
                  height: 100.0,
                  width: 300.0,
                  child: Material(
                    color: Colors.lightBlue,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StudentLogin()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Ink.image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/2784/2784403.png'),
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Student',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          SizedBox(
                            height: 6,
                          )
                        ],
                      ),
                    ),
                  )),

              Container(
                child: SizedBox(height: 10),
              ),

              Container(
                child: Column(
                  children: [
                    Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: SizedBox(height: 10),
              ),

              Container(
                  height: 100.0,
                  width: 300.0,
                  child: Material(
                    color: Colors.pink.shade600,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Ink.image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/1995/1995574.png'),
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Teacher',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          SizedBox(
                            height: 6,
                          )
                        ],
                      ),
                    ),
                  ))
            ] //ทำให้ไม่เกินด้านบนหรือด้านล่างหน้าจอ
                ), //สร้างกล่องภายในเพื่อโชว์ Logo
          ), //สร้างกล่อง Container ครอบเป็นพื้นหลัง
        ));
  }
}
