import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:for_testing/sharedPrefr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage.dart';
import 'loginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences  v = await SharedPreferences.getInstance();
  bool? value=false;
  value=  v.getBool("sett")??false;
  runApp( MyApp(islogged: value,));
}

class MyApp extends StatelessWidget {
  bool islogged;
   MyApp({Key? key,required this.islogged}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter shanu',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return HomePage();
          }else{
            return islogged == false ? Shared():LodinPage();
          }

        }
      ),
    );
  }
}

