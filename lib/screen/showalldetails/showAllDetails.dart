import 'package:flutter/material.dart';

class ShowAllDetails extends StatelessWidget {
  static const routeName = '/showalldetails';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map argu = ModalRoute.of(context).settings.arguments;
    String _categoty = argu['category'];
    String _name = argu['name'];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Positioned(
              top: size.height / 2,
              child: Container(
                height: size.height / 2,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$_categoty'.toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '$_name'.toUpperCase(),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0,top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,                    
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          SizedBox(height: 15.0),
                    Text(
                      'FROM',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    Text(
                      argu['price'],
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'SIZES : ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    Text(
                      'Small\nMedium\nLarge',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10.0),

                        ],),
                        Hero(
                          tag: argu['showNo'],
                          child: Image(
                            image: NetworkImage(argu['image']),
                            fit: BoxFit.cover,
                            height: size.height / 3,
                            filterQuality: FilterQuality.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            // Positioned(
            //   top: (MediaQuery.of(context).size.height / 2) - 155.0,
            //   left: (MediaQuery.of(context).size.width / 2) - 50.0,
            //   child: Container(
            //     padding: EdgeInsets.all(3),
            //     color: Colors.green[600],
            //     child: Hero(
            //       tag: argu['showNo'],
            //       child: Image(
            //         image: NetworkImage(argu['image']),
            //         fit: BoxFit.cover,
            //         height: size.height / 3,
            //         filterQuality: FilterQuality.none,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height / 2) + 65.0,
                    left: 20.0,
                    right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 12.0),
                    Text(
                      'Details :',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '\nIf you are completely new to houseplants then Ficus is a brilliant first plant to adopt, it is very easy to look after and won\'t occupy too much space.',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
