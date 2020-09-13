import 'package:flutter/material.dart';

class BrandProfilePicture extends StatelessWidget {
  final int id;
  final String profilePicture;
  BrandProfilePicture({@required this.id,@required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image:NetworkImage(profilePicture),fit: BoxFit.fill)
            ),
            width: MediaQuery.of(context).size.width * 0.13,
          ),
          SizedBox(
            width: 6.5,
          )
        ],
      ),
    );
  }
}
