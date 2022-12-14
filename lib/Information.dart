import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:htc_helper/home.dart';
import 'package:htc_helper/chat.dart';
import 'package:htc_helper/profile.dart';
import 'package:htc_helper/profile.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final users = database.collection("Student_info").snapshots();

    return Scaffold(
      appBar: AppBar(title: Text("Firestore Example")),
      body: StreamBuilder(
        stream: users,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount:
                snapshot.data!.docs.length, // Change "documents" to "docs"
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index]
                  .data(); // Change "documents" to "docs"
              return ListTile(
                title: Text(data["Name"] + "  " + data["Lname"]),
                subtitle: Text("ID : " + data["ID"]),
              );
            },
          );
        },
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        )),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(25),
      child: Wrap(
        runSpacing: 17,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Home(),
              ));
            },
          ),
          const Divider(
            color: Colors.black87,
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Information'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Home(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chat Bot'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Chat(),
              ));
            },
          ),
        ],
      ));
}
