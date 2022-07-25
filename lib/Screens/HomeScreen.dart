import 'package:flutter_assignment_3/Authenticate/Methods.dart';
import 'package:flutter_assignment_3/GroupChats/group_chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Chatty!"),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () => logOut(context))
        ],
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Column(
                children: [
                  const Text(
                    'Welcome To The Chatty App!',
                    style: TextStyle(
                        height: 2.5,
                        fontSize: 19.5,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'images/chatty.jpeg',
                    height: 250,
                    width: 250,
                  ),
                  Image.asset('images/welcome.gif', height: 250, width: 250),
                  const Text(
                    '\nClick here to start ->',
                    style: TextStyle(
                        height: 2.5,
                        fontSize: 19.5,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.group),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GroupChatHomeScreen(),
          ),
        ),
      ),
    );
  }
}
