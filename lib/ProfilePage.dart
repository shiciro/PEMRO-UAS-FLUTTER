import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'constants.dart';
import 'providers/transferVariables.dart' as global;
import 'providers/global.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('images/elon.png'), fit: BoxFit.fill),
                shape: BoxShape.rectangle),
          ),
          Container(
              child: Text("Bob Smith",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold))),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/");
                  saveListQuantity();
                },
                child: Text("Log Out"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29))))),
          )
        ],
      ),
    );
  }

  void saveListQuantity() async {
    var cachedListQuantity = FirebaseFirestore.instance.collection('testList');
    cachedListQuantity.add({'listQuantity': global.cachedQuantity});
  }
}
