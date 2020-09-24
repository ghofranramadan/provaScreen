import 'package:flutter/material.dart';

class BrandProfilePicture extends StatelessWidget {
  final int id;
  final String profilePicture;
  BrandProfilePicture({@required this.id, @required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: 44,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000),
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: NetworkImage(profilePicture), fit: BoxFit.fill)),
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
    );
  }
}
