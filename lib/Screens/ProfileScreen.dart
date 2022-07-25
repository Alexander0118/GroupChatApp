import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _Profile();
}

class _Profile extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Rating Screen")),
        body: Center(
          child: Column(
            children: [
              RatingBar.builder(
                itemCount: 5,
                allowHalfRating: true,
                initialRating: 4.5,
                onRatingUpdate: (value) {},
                itemBuilder: (BuildContext context, int index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
              ),
              Text(
                "Could not properly figure out how to set up the rating system.",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
