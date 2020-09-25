import 'package:flutter/material.dart';

class BrandProfilePicture extends StatelessWidget {
  final int id;
  final String profilePicture;
  BrandProfilePicture({@required this.id, @required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
              image: NetworkImage(profilePicture), fit: BoxFit.fill)),
    );
  }
}
