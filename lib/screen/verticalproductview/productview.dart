import 'package:flutter/material.dart';
import 'package:janathanursery/data/data.dart';
import 'package:janathanursery/screen/productList/contendata.dart';
import 'package:janathanursery/screen/productList/datacontent.dart';

import 'package:janathanursery/screen/showalldetails/showAllDetails.dart';
import 'package:janathanursery/theme/theme.dart';

class Productview extends StatelessWidget {
  static const routProduct = '/productview';
  String jsonurl;
  List janathadata;
  Productview({this.jsonurl, this.janathadata});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(


          child: GridView.builder(            
        itemCount: janathadata.length,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,),
        
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Map map = {
                  'image': janathadata[index].imgpath,
                  'name': janathadata[index].name,
                  'price': janathadata[index].price.toString(),
                  'showNo': janathadata[index].id,
                  'category': janathadata[index].category,
                };
                Navigator.of(context)
                    .pushNamed(ShowAllDetails.routeName, arguments: map);
              },
              child: DataContent(
                id: janathadata[index].id,
                name: janathadata[index].name,
                image: janathadata[index].imgpath,
                price: janathadata[index].price,
                info: janathadata[index].info,
              ));
        },
      )),
    );
  }
}
