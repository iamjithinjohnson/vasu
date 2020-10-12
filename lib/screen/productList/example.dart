import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _hideButtonController;

  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible)
          setState(() {
            _isVisible = false;
            print("**** $_isVisible up");
          });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible)
          setState(() {
            _isVisible = true;
            print("**** $_isVisible down");
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Center(
          child: new CustomScrollView(
        controller: _hideButtonController,
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  const Text('I\'m dedicating every day to you'),
                  const Text('Domestic life was never quite my style'),
                  const Text('When you smile, you knock me out, I fall apart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('I realize I am crazy'),
                ],
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isVisible ? 57.0 : 0.0,
        child: _isVisible
            ? new BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  new BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  new BottomNavigationBarItem(
                    icon: Icon(Icons.card_giftcard),
                    title: Text('Offers'),
                  ),
                  new BottomNavigationBarItem(
                    icon: Icon(Icons.account_box),
                    title: Text('Account'),
                  ),
                ],
                currentIndex: 0,
                backgroundColor: Colors.white,
                elevation: 10,
              )
            : Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              ),
      ),
    );
  }
}
