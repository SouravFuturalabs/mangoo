
// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LodinPage extends StatefulWidget {
  const LodinPage({Key? key}) : super(key: key);

  @override
  State<LodinPage> createState() => _LodinPageState();
}

class _LodinPageState extends State<LodinPage> {

  final EmailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                child: TextField(
                  controller: EmailController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(

                child: TextField(
                  controller: passwordController,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: ()async{

                final user = await auth.signInWithEmailAndPassword(email: EmailController.text, password: passwordController.text);
                 if(user!=null){
                   print("logged sucessfull");
                 }else{
                   print("somthing went wrong in logged");
                 }
                },
                child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.blue,
                  child: Center(child: Text("Login"),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: ()async{
                final user = await auth.createUserWithEmailAndPassword(email: EmailController.text, password: passwordController.text);

                  if(user!=null){
                    print("new  user created");
                  }else{
                    print("somthing went worng");
                  }

                },
                child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.blue,
                  child: Center(child: Text("Sign Up",),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
