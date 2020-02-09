import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loadingVisible = false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    
      final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 60.0,
            child: ClipOval(
              child: Image.network(
                'https://raw.githubusercontent.com/delay/flutter_firebase_auth_example/master/assets/images/default.png',
                fit: BoxFit.cover,
                width: 120.0,
                height: 120.0,
              ),
            )),
      );

      final signOutButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
          },
          padding: EdgeInsets.all(12),
          color: Theme.of(context).primaryColor,
          child: Text('SIGN OUT', style: TextStyle(color: Colors.white)),
        ),
      );

      final forgotLabel = FlatButton(
        child: Text(
          'Forgot password?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/forgot-password');
        },
      );

      final signUpLabel = FlatButton(
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
      );

      final signInLabel = FlatButton(
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/signin');
        },
      );
//check for null https://stackoverflow.com/questions/49775261/check-null-in-ternary-operation
      final email = "user@example.com";
      final firstName = "Kunal";
      final lastName = "Jain";
      final userIdLabel = Text('App Id: ');
      final emailLabel = Text('Email: ');
      final firstNameLabel = Text('First Name: ');
      final lastNameLabel = Text('Last Name: ');
      final settingsIdLabel = Text('SetttingsId: ');

      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      logo,
                      SizedBox(height: 48.0),
                      emailLabel,
                      Text(email,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      firstNameLabel,
                      Text(firstName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      lastNameLabel,
                      Text(lastName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      signOutButton,
                      signInLabel,
                      signUpLabel,
                      forgotLabel
                    ],
                  ),
                ),
              ),
            ),
        
      );
    }
  }
