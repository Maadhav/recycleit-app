  import 'package:flutter/material.dart';
  import 'package:intro_views_flutter/Models/page_view_model.dart';
  import 'package:intro_views_flutter/intro_views_flutter.dart';
  import 'package:homepage/login.dart';

  /// This is the main method of app, from here execution starts.
  void main() => runApp(MyApp());

  /// App widget class

  class MyApp extends StatelessWidget {
     static const TextTheme whiteMountainView = TextTheme(
    display4   : TextStyle(debugLabel: 'whiteMountainView display4',   fontFamily: 'Bree Serif', inherit: true, color: Colors.green, decoration: TextDecoration.none),
    display3   : TextStyle(debugLabel: 'whiteMountainView display3',   fontFamily: 'Bree Serif', inherit: true, color: Colors.green, decoration: TextDecoration.none),
    display2   : TextStyle(debugLabel: 'whiteMountainView display2',   fontFamily: 'Bree Serif', inherit: true, color: Colors.green, decoration: TextDecoration.none),
    display1   : TextStyle(debugLabel: 'whiteMountainView display1',   fontFamily: 'Bree Serif', inherit: true, color: Colors.green, decoration: TextDecoration.none),
    headline   : TextStyle(debugLabel: 'whiteMountainView headline',   fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
    title      : TextStyle(debugLabel: 'whiteMountainView title',      fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
    subhead    : TextStyle(debugLabel: 'whiteMountainView subhead',    fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
    body2      : TextStyle(debugLabel: 'whiteMountainView body2',      fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
    body1      : TextStyle(debugLabel: 'whiteMountainView body1',      fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
    caption    : TextStyle(debugLabel: 'whiteMountainView caption',    fontFamily: 'Bree Serif', inherit: true, color: Colors.green, decoration: TextDecoration.none),
    button     : TextStyle(debugLabel: 'whiteMountainView button',     fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
    subtitle   : TextStyle(debugLabel: 'whiteMountainView subtitle',   fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
    overline   : TextStyle(debugLabel: 'whiteMountainView overline',   fontFamily: 'Bree Serif', inherit: true, color: Colors.green,   decoration: TextDecoration.none),
  );
    //making list of pages needed to pass in IntroViewsFlutter constructor.
    final pages = [
      PageViewModel(
          pageColor: const Color(0xFF03A9F4),
          body: Text(
            'Reducing is about understanding how to not produce trash.',
          ),
          title: Text(
            'Reduce',
          ),
          titleTextStyle: TextStyle(fontFamily: 'Bree Serif', color: Colors.white),
          bodyTextStyle: TextStyle(fontFamily: 'Bree Serif', color: Colors.white),
          mainImage: Image.asset(
            'assets/reduce.png',
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          )),
      PageViewModel(
        pageColor: const Color(0xFF8BC34A),
        // iconImageAssetPath: 'assets/waiter.png',
        body: Text(
          'Recycling is the process of converting waste materials into new materials and objects.',
        ),
        title: Text('Recycle'),
        mainImage: Image.asset(
          'assets/recycle.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        titleTextStyle: TextStyle(fontFamily: 'Bree Serif', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'Bree Serif', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFFfec200),
        body: Text(
          'Reuse is the action or practice of using an item, whether for its original purpose or to fulfil a different function.',
        ),
        title: Text('Reuse'),
        mainImage: Image.asset(
          'assets/reuse.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        titleTextStyle: TextStyle(fontFamily: 'Bree Serif', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'Bree Serif', color: Colors.white),
      ),
    ];

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IntroViews Flutter', //title of app
        theme: ThemeData(
          textTheme: whiteMountainView
        ),
        home: Builder(
          builder: (context) => IntroViewsFlutter(
            pages,
            showNextButton: true,
            showBackButton: true,
            onTapDoneButton: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ), //MaterialPageRoute
              );
            },
            pageButtonTextStyles: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ), //IntroViewsFlutter
        ), //Builder
      ); //Material App
    }
  }

  /// Home Page of our example app.

