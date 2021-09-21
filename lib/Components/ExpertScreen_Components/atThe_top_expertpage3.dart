import 'package:flutter/material.dart';

class AtTheTopExpertPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 100, top: 0.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Column(
              children: [
                Text(
                  'Example with steps ',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Example with steps ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
