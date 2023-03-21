import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



void getWorldTime() async {
  WorldTime wt = WorldTime(location: 'London', flag: 'England', url: 'Europe/London');
  await wt.getTime();

  Navigator.pushReplacementNamed(context, '/home' , arguments: {
    'location' : wt.location ,
    'flag' : wt.flag ,
    'time' : wt.time ,
    'isDayTime' : wt.isDayTime,

  });

}


  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
