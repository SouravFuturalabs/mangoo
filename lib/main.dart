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

        primarySwatch: Colors.red,
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

