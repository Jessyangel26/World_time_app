import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:worldapp/services/world_time.dart';
import 'package:worldapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await   instance.getTime();
        Navigator.pushReplacementNamed(context, '/home',arguments: {
          'location': instance.location,
          'time': instance.time,
          'flag':instance.flag,
          'isDaytime':instance.isDaytime,
        });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body:Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
