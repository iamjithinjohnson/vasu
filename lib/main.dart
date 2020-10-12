import 'package:flutter/material.dart';
import 'package:janathanursery/screen/productList/exampleserver.dart';
import 'package:janathanursery/screen/productList/productlist.dart';
import 'package:janathanursery/screen/profile/profile.dart';
import 'package:janathanursery/screen/showalldetails/showAllDetails.dart';
import 'package:janathanursery/screen/verticalproductview/productview.dart';
import './screen/productList/example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      
      routes: {
        Profile.routProfile: (context) => Profile(),
        ShowAllDetails.routeName: (context) => ShowAllDetails(),
        Productview.routProduct: (context) => Productview(),
      },
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}
