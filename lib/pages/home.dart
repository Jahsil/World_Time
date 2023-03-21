import 'package:flutter/material.dart';
import '';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;


    String bg = "";
    if (data['isDayTime'] == true){
      bg = 'day.png';
    }else{
      bg = 'night.png';
    }
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic res = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'location' : res['location'] ,
                            'flag' : res['flag'] ,
                            'time' : res['time'] ,
                            'isDayTime' : res['isDayTime'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                          "edit location",
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                        style: TextStyle(
                          fontSize: 30 ,
                          letterSpacing: 2 ,
                          color: Colors.white,
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                      data['time'],
                    style: TextStyle(
                      fontSize: 60 ,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
