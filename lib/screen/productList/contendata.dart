import 'package:flutter/material.dart';
import 'package:janathanursery/theme/theme.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';

class ContentData extends StatelessWidget {
  ContentData({
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
      margin: EdgeInsets.only(
        left: 10,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 30),
            blurRadius: 20,
            color: Colors.grey.withOpacity(0.10),
          ),
        ],
      ),
      width: size.width * 0.44,
      
      
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: id,
            child: FadeInImage.memoryNetwork(
              // Plant image
              height: size.height * 0.24,

              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: image,
            ),
          ),

          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 50, left: 10, right: 10)),
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

          // Text("money plant \n".toUpperCase(),
          //     style: Theme.of(context).textTheme.button),

          // Row(
          //   children: <Widget>[
          //     RichText(
          //       text: TextSpan(
          //         children: [
          //           // TextSpan(
          //           //     text: "money plant\n".toUpperCase(),
          //           //     style: Theme.of(context).textTheme.button),
          //           // TextSpan(
          //           //   text: '\$$price',
          //           //   style: Theme.of(context)
          //           //       .textTheme
          //           //       .button
          //           //       .copyWith(color: kPrimaryColor),
          //           // ),
          //         ],
          //       ),
          //     ),
          //     Spacer(),
          //     //  PopupMenuButton(
          //     //   // Popup menu button
          //     //   icon: Icon(
          //     //     // popupmenu icon
          //     //     Icons.more_vert,
          //     //     size: 14,
          //     //   ),
          //     //   itemBuilder: (context) => <PopupMenuEntry>[
          //     //     PopupMenuItem(
          //     //       child: GestureDetector(
          //     //           onTap: () async {
          //     //             String url = info;
          //     //             if (await canLaunch(url)) {
          //     //               await launch(url);
          //     //             } else {
          //     //               throw 'Could not launch $url';
          //     //             }
          //     //           },
          //     //           child: Text("info")),
          //     //     ),
          //     //   ],
          //     // ),
          //   ],
          // )
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     width: size.width*0.4,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.withOpacity(0.20),
    //           spreadRadius: 0,
    //           blurRadius: 2,
    //           offset: Offset(0, 3),
    //         )
    //       ],
    //     ),
    //     child: Column(

    //       children: <Widget>[
    //         Hero(
    //           // picture animation
    //           tag: id,
    //           child: ClipRRect(
    //             // used border side curve top left and right
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(10),
    //               topRight: Radius.circular(10),
    //             ),
    //             child: FadeInImage.memoryNetwork(
    //               // Plant image
    //               height: 120,
    //               width: 135,
    //               fit: BoxFit.cover,
    //               placeholder: kTransparentImage,
    //               image: image,

    //               //     Image.asset(
    //               //   'assets/img/img1.jpeg',
    //               //   height: 120,
    //               //   fit: BoxFit.cover,
    //               //   filterQuality: FilterQuality.none,
    //               // ),

    //               //FlutterLogo(size:100),
    //               //).
    //             ),
    //           ),
    //         ),
    //         Flexible(
    //           flex: 1,
    //           child: Padding(
    //             padding: const EdgeInsets.only(left: 10, top: 4),
    //             child: Text(
    //               // Plant name
    //               name,

    //               softWrap: true,
    //               style: textstylee,
    //             ),
    //           ),
    //         ),
    //         Flexible(
    //           flex: 1,
    //           child: Row(
    //             // row between price and popup menu
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 10),
    //                 child: Text(
    //                   // Plant Price
    //                   '\$' + price.toString(),
    //                   softWrap: true,
    //                   style: textstylee,
    //                 ),
    //               ),
    //               PopupMenuButton(
    //                 // Popup menu button

    //                 icon: Icon(
    //                   // popupmenu icon
    //                   Icons.more_vert,
    //                   size: 14,
    //                 ),
    //                 itemBuilder: (context) => <PopupMenuEntry>[
    //                   PopupMenuItem(
    //                     child: GestureDetector(
    //                         onTap: () async {
    //                           String url = info;
    //                           if (await canLaunch(url)) {
    //                             await launch(url);
    //                           } else {
    //                             throw 'Could not launch $url';
    //                           }
    //                         },
    //                         child: Text("info")),
    //                   ),
    //                 ],
    //               ),

    //               // IconButton(iconSize: 17,icon: Icon(Icons.more_vert), onPressed: ()=>print('pressed'))
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
