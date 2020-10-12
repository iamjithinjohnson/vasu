import 'package:flutter/material.dart';
import 'package:janathanursery/theme/theme.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';

class DataContent extends StatelessWidget {
  DataContent({
    this.id,
    this.name,
    this.price,
    this.image,
    this.info,
  });

  final String image, name, info, id;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      
      
      
      
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: id,
            child: FadeInImage.memoryNetwork(
              // Plant image
              height: 100,

              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: image,
            ),
          ),

          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only( left: 10, right: 10)),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "$name \n".toUpperCase(),
                    style: Theme.of(context).textTheme.button),
                TextSpan(
                  text: '\$$price',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: kPrimaryColor),
                ),
              ])),
            ],
          ),
        ],
      ),
    );

  }
}
