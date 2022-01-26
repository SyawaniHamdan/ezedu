import 'package:flutter/material.dart';

class TutorProfileBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            //height: 50,
            padding: const EdgeInsets.only(bottom: 40),
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'CANCEL',
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 2.2, color: Colors.black),
                )),
          ),
          Container(
              //height: 50,
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black),
                  ))),
        ],
      ),
    );
  }
}
