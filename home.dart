import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Container(
            alignment: (Alignment.center),
            child: Image.asset(
              'Images/Group2.png',
              // fit: BoxFit.contain,
              // width: 150.0,
              // height: 150.0,
            )),
        elevation: 10.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
// Content
            Row(),
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                color: Colors.red,
                // margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.only(
                    top: 50.0, left: 10.0, right: 10.0, bottom: 100.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 40);
    var firstControlPoint = Offset(25.0, size.height - 10);
    var firstEndPoint = Offset(size.width / 2, size.height - 5);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - 25, size.height - 10);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
