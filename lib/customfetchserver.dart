import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:janathanursery/screen/productList/contendata.dart';
import 'package:janathanursery/screen/showalldetails/showAllDetails.dart';
import 'package:janathanursery/screen/verticalproductview/productview.dart';

import 'constant.dart';
import 'data/data.dart';

class CustomFetchServer extends StatefulWidget {
  CustomFetchServer({this.urrll});
  final String urrll;

  @override
  _CustomFetchServerState createState() => _CustomFetchServerState();
}

class _CustomFetchServerState extends State<CustomFetchServer> {
  List<Data> janathaData = janatha();
  Future<void> fetchFromServer(String url) async {
    // empty data . data from github json
    //checking list is empty or not
    if (janathaData.isNotEmpty)
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
  }

  void _sendDataToProductviewScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Productview(
            jsonurl: widget.urrll,
            janathadata: janathaData,
          ),
        ));
  }

  @override
  void initState() {
    Duration(seconds: 3);
    fetchFromServer(widget.urrll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        //future: fetchFromServer(widget.urrll),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            // if there is no connection
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'no internet',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      Icon(
                        Icons.signal_cellular_connected_no_internet_4_bar,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    //refreh button
                    child: IconButton(
                      icon: Icon(Icons.refresh),
                      color: Colors.blueGrey,
                      onPressed: () => setState(() {}), // simply refresh
                      iconSize: 60,
                    ),
                  ),
                  Text(
                    'refresh',
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
            );
          }
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  // connection waiting
                  heightFactor: 5,
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => _sendDataToProductviewScreen(context),
                      child: Text(
                        'view all',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      // connection done
                      padding: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.48,
                      child: ListView.builder(
                          // shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: janathaData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Map map = {
                                    'image': janathaData[index].imgpath,
                                    'name': janathaData[index].name,
                                    'price':
                                        janathaData[index].price.toString(),
                                    'showNo': janathaData[index].id,
                                    'category': janathaData[index].category,
                                  };
                                  Navigator.of(context).pushNamed(
                                      ShowAllDetails.routeName,
                                      arguments: map);
                                },
                                child: ContentData(
                                  id: janathaData[index].id,
                                  name: janathaData[index].name,
                                  image: janathaData[index].imgpath,
                                  price: janathaData[index].price,
                                  info: janathaData[index].info,
                                ));
                          }),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
