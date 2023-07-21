import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String,dynamic>? data;

  @override
  Widget build(BuildContext context) {
    data = data!=null ?data: ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, dynamic>?;
    print(data);

    //set backround
    String bgImage = (data != null && data!['IsdayTime'] != null)
        ? (data!['IsdayTime'] ? 'day.png' : 'night.png')
        : 'night.png';
    if (data == null || data!['location'] == null || data!['time'] == null) {

      return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitDualRing(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      );
    }
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/${bgImage}'),
                fit: BoxFit.fill,
    ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                  dynamic result = await  Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data!['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.grey[300],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data!['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.grey[300],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

