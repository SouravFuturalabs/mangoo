import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text("home page"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: ()async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LodinPage()));

                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text("sign out"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
