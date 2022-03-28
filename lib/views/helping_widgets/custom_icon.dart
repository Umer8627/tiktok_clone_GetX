import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(children: [
        Container(
          width: 38,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 250, 45, 108),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        Container(
            width: 38,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(7),
            )),
        Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ]),
    );
  }
}
