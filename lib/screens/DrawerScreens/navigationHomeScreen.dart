import 'package:EcoJourney/screens/History.dart';
import 'package:EcoJourney/screens/SixthSense.dart';
import 'package:EcoJourney/screens/TravelFlowScreens/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../AutoRegistration.dart';
import '../Rewardz.dart';
import '../Settings.dart';
import 'appDrawer.dart';
import 'drawerUserController.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HomeScreen();
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          title: Text(
            'Leave EcoJourney',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Are you sure you want to exit?\n"),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 16.0,
                          ),
                        ),
                        Text(
                          'Stay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Leave',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
            backgroundColor: AppTheme.nearlyWhite,
            body: DrawerUserController(
              screenIndex: drawerIndex,
              drawerWidth: MediaQuery.of(context).size.width * 0.75,
              animationController: (AnimationController animationController) {
                sliderAnimationController = animationController;
              },
              onDrawerCall: (DrawerIndex drawerIndexdata) {
                changeIndex(drawerIndexdata);
              },
              screenView: screenView,
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.SixthSense) {
        setState(() {
          screenView = SixthSense();
        });
      } else if (drawerIndex == DrawerIndex.TravelHistory) {
        setState(() {
          screenView = History();
        });
      } else if (drawerIndex == DrawerIndex.Rewardz) {
        setState(() {
          screenView = Rewardz();
        });
      } else if (drawerIndex == DrawerIndex.Rickshaw) {
        setState(() {
          screenView = AutoRegistration();
        });
      } else if (drawerIndex == DrawerIndex.Settings) {
        setState(() {
          screenView = Settings();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = HomeScreen();
          drawerIndex = DrawerIndex.HOME;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              title: Text(
                'About EcoJourney',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      "This app is designed & developed by Team MicrosoftHack3rs in Incubate India Hackathon held on 21st & 22nd December 2019 in Gurugram, India."),
                ],
              ),
            );
          },
        );
      } else {
        //do in your way......
      }
    }
  }
}
