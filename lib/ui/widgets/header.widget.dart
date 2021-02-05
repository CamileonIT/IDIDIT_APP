import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderDetail extends StatelessWidget {
  final String image;
  final bool isLike;
  final Function onBackPress, onLikePress;

  const HeaderDetail({
    Key key,
    @required this.image,
    this.isLike = false,
    @required this.onBackPress,
    @required this.onLikePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 2.4,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipPath(
            clipper: RoundedClipper(),
            child: Image.asset(
              this.image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 1.5, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
