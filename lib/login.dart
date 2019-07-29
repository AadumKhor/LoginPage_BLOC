import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController _tabController;
  String email, password, name;

  @override
  void initState() {
    _tabController = new TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage("assets/images/icon.png"))),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.redAccent[400],
                indicatorWeight: 2.0,
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 400.0,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[_loginPage(email, password), _signUpPage()],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.grey,
              endIndent: 10.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            _threeOptions()
          ],
        ),
      ),
    );
  }

  Widget _threeOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 40.0,
          height: 40.0,
          child: Icon(Icons.free_breakfast),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          child: Icon(Icons.free_breakfast),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          child: Icon(Icons.free_breakfast),
        )
      ],
    );
  }

  Widget _loginPage(String email, String password) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _nameWithCard('Email', email),
          SizedBox(
            height: 10.0,
          ),
          _nameWithCard('Password', password),
          SizedBox(
            height: 20.0,
          ),
          _screenButton('Login'),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _screenButton(String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 1.7,
                fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                tileMode: TileMode.clamp,
                stops: [0.2, 100.0],
                colors: [Color(0xff3059e1), Color(0xff3ca2b3)])),
      ),
    );
  }

  Widget _signUpPage() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _nameWithCard('Name', name),
          SizedBox(
            height: 10.0,
          ),
          _nameWithCard('Email', email),
          SizedBox(
            height: 10.0,
          ),
          _nameWithCard('Password', password),
          SizedBox(
            height: 20.0,
          ),
          _screenButton('Sign up')
        ],
      ),
    );
  }

  Widget _nameWithCard(String heading, String input) {
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            heading,
            style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
                fontSize: 12.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
          elevation: 3.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            width: double.infinity,
            height: 60.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                  onChanged: (value) => input = value,
                  decoration: InputDecoration.collapsed(
                      hintText: '', hoverColor: Colors.red[100]),
                ),
              ),
            ),
          )),
    ]);
  }
}
