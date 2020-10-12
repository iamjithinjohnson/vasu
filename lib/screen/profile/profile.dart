import 'package:flutter/material.dart';
import 'package:janathanursery/data/data.dart';
import 'package:janathanursery/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:transparent_image/transparent_image.dart';

class Profile extends StatelessWidget {
  static const routProfile = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_grey,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[           
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: CustomAppBarPro(),
                ),
                Expanded(                       // white color big box
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  janathaLogo(),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Janatha Nursery',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Kunnamkulam',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BrowserLink(
                          logoLink: Data.youtubeLogo,
                          color: Colors.red,
                          browserLink: Data.youtubeBro,
                        ),
                        BrowserLink(
                          logoLink: Data.faceLogo,
                          color: Colors.blue,
                          browserLink: Data.faceBro,
                        ),
                        BrowserLink(
                          logoLink: Data.instaLogo,
                          color: Colors.purple,
                          browserLink: Data.instaBro,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container janathaLogo() {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.50),
          spreadRadius: 0,
          blurRadius: 20,
          offset: Offset(0, 10),
        )
      ]),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(Data.janathaLogo),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class BrowserLink extends StatelessWidget {
  final String logoLink, browserLink;
  final Color color;

  BrowserLink({this.logoLink, this.color, this.browserLink});

  _launchURL() async {
    String url = browserLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.40),
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(0, 5),
        )
      ]),
      child: GestureDetector(
        onTap: _launchURL,
        child: ClipOval(
          clipBehavior: Clip.antiAlias,
          child:
           Image.network(
            logoLink,
            height: 30,
            width: 30,
            filterQuality: FilterQuality.none,
          ),
        ),
      ),
    );
  }
}

class CustomAppBarPro extends StatelessWidget {
  const CustomAppBarPro({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Icon(
              Icons.location_searching,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
