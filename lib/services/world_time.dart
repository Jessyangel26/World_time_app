import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  String location;
  String time='';
  String flag;
  String url;
  bool isDaytime=false;

  WorldTime({required this.location,required this.flag,required this.url });


  Future<void> getTime() async{
try{
  http.Response response=await
  http.get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"
  ));
  Map data=jsonDecode(response.body);
  print(data);

  //get properties from data
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
  print(datetime);
  print(offset);

  //create a datetime object
  DateTime now = DateTime.parse(datetime);
  now=now.add(Duration(hours: int.parse(offset)));
  print(now);

  //set a time property
  time = DateFormat.jm().format(now) ;
  isDaytime=now.hour>6 && now.hour<20? true:false;
}
catch(e){
print('caught error: $e');
time = 'could not get time data';
}
    //make a response

  }

}