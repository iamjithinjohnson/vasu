import 'dart:convert';

import 'package:janathanursery/screen/productList/customappbar.dart';
import 'package:janathanursery/screen/showalldetails/showAllDetails.dart';
import 'package:janathanursery/screen/verticalproductview/productview.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:janathanursery/data/data.dart';
import 'package:janathanursery/screen/profile/profile.dart';
import 'package:janathanursery/theme/theme.dart';
import 'package:http/http.dart' as http;
import '../../customfetchserver.dart';
import './contendata.dart';
import 'package:janathanursery/constant.dart';

enum PageEnum {
  firstPage,
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with TickerProviderStateMixin { 
  TabController tabController;
  //GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey(); -> another example
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(); // scaffold key for drawer

  final _itemCount = 4;
  final _checkedItems = [false, false, false, false];

  int _selectedIndex;
  bool _applyWorkaround = false;

  List _categoty = []; // created for temperoily

  List<Data> janathaData = janatha(); // empty data . data from github json

  List _filterData = [];

  var _isVisible; // true

  // productList -> Profile
  // for face icon to profile.dart

  // fetching server from github
  Future<void> fetchFromServer(String url) async {
    
    //checking list is empty or not
    if(janathaData.isNotEmpty)
      janathaData.clear();
    else
      debugPrint('janathaData is Empty');
    
    
    final fetchData = await http.get(url);
    //print(fetchData.body);
    final decodeData =
        json.decode(fetchData.body); // decode json file from github
    print(decodeData);

    for (var item in decodeData) {
      //  decodeData -> item
      janathaData.add(
        Data(
          id: item['id'],
          category: item['category'],
          name: item['name'],
          price: item['price'],
          imgpath: item['imgpath'],
          info: item['info'],
        ),
      );
    }

    print(janathaData.length);
    for (var item in janathaData) {
      // removing repeated content from janathaData to category
      if (_categoty
          .where((element) => element == item.category)
          .toList()
          .isNotEmpty) {
        continue;
      }
      _categoty.add(item.category);
    }
  }

  onPressedEvent(BuildContext context) {
    Navigator.of(context).pushNamed(Profile.routProfile);
  }

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 5, vsync: this);

    var tabBarItem = TabBar(

      tabs: [
        Tab(
          child: Text(
            'Indoor',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Outdoor',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Plant',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Seeds',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Pots',
            style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.withOpacity(0.5),
      isScrollable: true,
    );

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            //controller: _hideButtonController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomAppBar(
                  onpressface: () => onPressedEvent(context),
                  //another example -> Scaffold.of(context).openDrawer(); in this case not need global variable
                  onpressdrawer: () => _scaffoldKey.currentState.openDrawer(),
                ),
                textfield(),

                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: tabBarItem,
                ),
               Container(
                  height: MediaQuery.of(context).size.height - 200.0,
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[

                      CustomFetchServer(urrll: Data.jsonindoor),
                      CustomFetchServer(urrll: Data.jsonoutdoor),
                      CustomFetchServer(urrll: Data.jsonindoor),
                      CustomFetchServer(urrll: Data.jsonoutdoor),
                      CustomFetchServer(urrll: Data.jsonindoor)
                      
                     

                    ],
                  ),
                ),
                //text('Recently Added'),
                //line(),
                //recentlyAdded(context, janathaData),
                // FutureBuilder(
                //   future: fetchFromServer(_urrll),
                //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                //     if (snapshot.hasError) {
                //       // if there is no connection
                //       return Padding(
                //         padding: const EdgeInsets.only(top: 10),
                //         child: Column(
                //           children: <Widget>[
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: <Widget>[
                //                 Text(
                //                   'no internet',
                //                   style: TextStyle(
                //                       color: Colors.blueGrey,
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 26),
                //                 ),
                //                 Icon(
                //                   Icons
                //                       .signal_cellular_connected_no_internet_4_bar,
                //                   color: Colors.blueGrey,
                //                 ),
                //               ],
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(top: 50),
                //               //refreh button
                //               child: IconButton(
                //                 icon: Icon(Icons.refresh),
                //                 color: Colors.blueGrey,
                //                 onPressed: () =>
                //                     setState(() {}), // simply refresh
                //                 iconSize: 60,
                //               ),
                //             ),
                //             Text(
                //               'refresh',
                //               style: TextStyle(color: Colors.blueGrey),
                //             )
                //           ],
                //         ),
                //       );
                //     }
                //     return snapshot.connectionState == ConnectionState.waiting
                //         ? Center(
                //             // connection waiting
                //             heightFactor: 5,
                //             child: CircularProgressIndicator(),
                //           )
                //         : Column(
                //             children: <Widget>[
                //               FlatButton(
                //                 onPressed: () =>
                //                     _sendDataToProductviewScreen(context),
                //                 child: Text(
                //                   'view all',
                //                   style: TextStyle(
                //                     color: kPrimaryColor,
                //                     fontSize: 18,
                //                   ),
                //                 ),
                //               ),
                //               Container(
                //                 // connection done
                //                 padding: const EdgeInsets.only(top: 10),
                //                 width: MediaQuery.of(context).size.width,
                //                 height:
                //                     MediaQuery.of(context).size.height * 0.48,
                //                 child: ListView.builder(
                //                     // shrinkWrap: true,
                //                     //physics: NeverScrollableScrollPhysics(),
                //                     scrollDirection: Axis.horizontal,
                //                     itemCount: janathaData.length,
                //                     itemBuilder:
                //                         (BuildContext context, int index) {
                //                       return GestureDetector(
                //                           onTap: () {
                //                             Map map = {
                //                               'image':
                //                                   janathaData[index].imgpath,
                //                               'name': janathaData[index].name,
                //                               'price': janathaData[index]
                //                                   .price
                //                                   .toString(),
                //                               'showNo': janathaData[index].id
                //                             };
                //                             Navigator.of(context).pushNamed(
                //                                 ShowAllDetails.routeName,
                //                                 arguments: map);
                //                           },
                //                           child: ContentData(
                //                             id: janathaData[index].id,
                //                             name: janathaData[index].name,
                //                             image: janathaData[index].imgpath,
                //                             price: janathaData[index].price,
                //                             info: janathaData[index].info,
                //                           ));
                //                     }),
                //               ),
                //             ],
                //           );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
      key: _scaffoldKey, // assign key to Scaffold
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.grey,
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text('Janatha Nursery'),
                  Text('Phone : 9745369474,04885223603'),
                  Text('Guruvayoor road, Kunnamkulam')
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.picture_in_picture),
              title: Text('Gallery'),
              onTap: () {
                // enter something
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Location'),
              onTap: () {
                // enter something
              },
            ),
            ListTile(
              leading: Icon(Icons.hourglass_empty),
              title: Text('Privacy Policy'),
              onTap: () {
                //enter something
              },
            ),
            ListTile(
              leading: Icon(Icons.hourglass_empty),
              title: Text('Terms and condition'),
              onTap: () {
                //enter something
              },
            )
          ],
        ),
      ),
    );
  }

  Padding textfield() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color_grey.withOpacity(0.50),
              blurRadius: 5,
            )
          ],
        ),
        child: TextField(
          autofocus: false,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color_grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(
                right: 15,
                left: 8,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 24,
                  color: color_grey,
                ),
                onPressed: () => null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding line() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 0.4,
        color: color_grey.withOpacity(0.5),
      ),
    );
  }

  Padding text(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(text),
    );
  }
}