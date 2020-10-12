import 'package:flutter/material.dart';
import 'package:janathanursery/data/data.dart';
import 'package:janathanursery/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  Function onpressface, onpressdrawer;
  CustomAppBar({this.onpressface, this.onpressdrawer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // menu
          GestureDetector(
            onTap: onpressdrawer,
            child: Icon(
              Icons.menu,
              color: color_grey,
            ),
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.50),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ]),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(Data.janathaLogo),
              backgroundColor: Colors.transparent,
            ),
          ),
          GestureDetector(
            onTap: onpressface,
            child: Icon(
              Icons.face,
              color: color_grey,
            ),
          )
        ],
      ),
    );
  }
}
