import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location ;
  late String time ;
  late String flag ;
  late String url ;
  late bool isDayTime;

  WorldTime({required String location , required String flag , required String url}){
    this.location = location;
    this.flag = flag;
    this.url = url;
  }
  Future<void> getTime() async {
  try {
    Response response = await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour >= 6 && now.hour <= 18 ? true : false ;
    time = DateFormat.jm().format(now);

  }catch (e) {
    print('error with api endpoint $e');
    time = "cant get time data";
  }
  }


  }

