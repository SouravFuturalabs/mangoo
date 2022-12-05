import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends StatefulWidget {
  const Shared({Key? key}) : super(key: key);

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: InkWell(
            onTap: ()async{
              SharedPreferences  addValues = await SharedPreferences.getInstance();
              addValues.setBool("sett", true);
              print(addValues.getBool("sett"));


            },
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
              child: Center(
                child: Text("Login"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
