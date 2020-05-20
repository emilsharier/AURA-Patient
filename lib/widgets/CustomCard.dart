import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String title, assetPath, data;
  double size;
  Color color;

  CustomCard(
      {this.title,
      this.assetPath,
      this.data,
      this.size = 12,
      this.color = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 10.0,
              bottom: 10.0,
              right: 5.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: size - 15,
                        fontFamily: 'MontserratSemiBold',
                      ),
                    ),
                    Image.asset(
                      assetPath,
                      width: 40,
                      height: 40,
                      alignment: Alignment.topRight,
                    ),
                  ],
                ),
                Text(
                  data,
                  style: TextStyle(
                    fontSize: size,
                    color: color,
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
