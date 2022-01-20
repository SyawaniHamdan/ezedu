import 'package:flutter/material.dart';

class HomeMainFloat extends StatefulWidget {


  @override
  _HomeMainFloat createState() => _HomeMainFloat();
}

class _HomeMainFloat extends State<HomeMainFloat> { 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 50, 15, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 180),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary : Colors.teal,
            primary: Colors.blueGrey[900],
            minimumSize: Size.fromHeight(50),
            shape: StadiumBorder(),
          ),
          child: FittedBox(
            child: Text('Tutor',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: (){},
          ),
          const SizedBox(height: 25),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary : Colors.teal,
            primary: Colors.blueGrey[900],
            minimumSize: Size.fromHeight(50),
            shape: StadiumBorder(),
            
          ),
          child: FittedBox(
            child: Text('Student',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: (){},
          ),
          const SizedBox(height: 25),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary : Colors.teal,
            primary: Colors.blueGrey[900],
            minimumSize: Size.fromHeight(50),
            shape: StadiumBorder(),
          ),
          child: FittedBox(
            child: Text('Guest',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: (){},
          ),
        ],
        )
      );
  }
}
