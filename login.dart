import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'Rekor: Ciptakan Juara',
        //     style: TextStyle(color: Colors.yellow),
        //   ),
        //   elevation: 10.0,
        // ),
        body: Center(
      child: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
//content
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                color: Colors.redAccent[700],
                // margin: EdgeInsets.only(bottom: 20.0),
                child: RekorImageAsset(),
                padding: EdgeInsets.only(
                    top: 50.0, left: 10.0, right: 10.0, bottom: 100.0),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please input Username';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please input Password';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Password '),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                  elevation: 10.0,
                  color: Colors.redAccent[700],
                  textColor: Colors.white,
                  child: Text(
                    'Log In',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    debugPrint("Registered");
                    Navigator.pushNamed(context, '/second');
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
// End
          ],
        ),
      ),
    ));
  }
}

class RekorImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('Images/Rekor.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 175.0,
    );
    return Container(
      child: image,
      // width: 200.0,
      // height: 225.0,
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height - 65);
    var firstEndPoint = Offset(size.width / 2, size.height - 25.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.75), size.height + 20);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
